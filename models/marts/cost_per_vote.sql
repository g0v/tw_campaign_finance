with __expense as (
    select election_name, locality, candidate, sum(raise_amount) as total_raise, sum(expense_amount) as total_expense from {{ ref('stg_transaction') }} group by all
),

__candidate as (
    select * from {{ ref('stg_candidate') }}
),

__vote as (
    select * from {{ ref('total_vote') }}
)

select

__vote.election_name, __vote.locality, __vote.candidate, elected, total_raise/total_vote as raise_per_vote, total_expense/total_vote as expense_per_vote

from __vote
    left join __expense on
        __vote.election_name = __expense.election_name and
        __vote.locality = __expense.locality and
        __vote.candidate = __expense.candidate
    left join __candidate on
        __vote.election_name = __candidate.election_name and
        __vote.locality = __candidate.locality and
        __vote.candidate = __candidate.candidate
