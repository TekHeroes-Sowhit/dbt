
with entires as(
    select *
    from {{ref('entries')}}
), accounts as(

    select * 
    from {{ref('')}}
)

select
  txn_date,
  account_id,
  adjusted_amount,
  description,
  account_name,
  sum(adjusted_amount) over (partition by account_id order by id rows unbounded preceding)
from journal_entries
order by account_id, id

To compile the above code

dbt compile

Then, look for the compiled SQL file in target/compiled/{project name}/analyses/running_total_by_account.sql. This sql can then be pasted into a data visualization tool, for instance. Note that no running_total_by_account relation will be materialized in the database as this is an analysis, not a model.
