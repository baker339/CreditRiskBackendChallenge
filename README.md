# Hello, Ally team!

### A little bit of background on what I am presenting here.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
### The Database
For the database I decided to use a MySQL database.
I am more comfortable with SQL Server in general, but I also
wanted to do this challenge on my personal computer,
which is a MacBook Pro. So, I opted to use MySQL.
I included a folder called database just to hold a backup
of the database, a text file to create the stored
procedures, and a diagram of the table schema.

### The Backend
I opted to use an MVC model and a simple .Net core web app,
just because the scope of the project seemed to me to be
just a light application to display data.

### The Front End
The challenge was to build the backend, so I didn't do too
much to make a fancy front end. But, I tried to do a little
formatting and make things a little prettier both for the
sake of making things easy to read but also just to have
a little fun.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

### Where do I see gaps and what do I think could be expanded in the future?

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
### The Database
The way the database is currently setup, I am fairly
happy with the schema. What I am uncomfortable with
is the puopulation of the calcLimit table. At first,
I was not going to put any further population strategy,
but it didn't make sense to me to have to call the
population sproc adhoc. The way I originally wrote
it though allowed it to be safely called in the data
read sproc without creating unnecessary records.
The problem that I see is that if this system ever
grew to more banks, we could severely reduce performance
of the read sproc, which would need to be quick to pull
data. If the scope of the data was to be daily limits,
I think that it would make sense to have a daily population
job and then remove the population from the read.
This would leave just one light weight read sproc and
would not require adhoc runs of calcLimit population.

The other piece of the database is currently there is
contingency in place in the case of updating the other
tables or adding new banks. I think that a good way to
handle this would be to parameterize the calculation
sproc. Then, setup on trigger on insert and update to
the tables to calculate or recalculate limits for only
the inserted or updated records.

### The Backend
Currently, the data read is very simple. It relies on
using a reader to grab data from the read sproc and
populates the model accordingly. This was written
specifically for the limit model though. In an ideal
world, I would like to see a reusable API created
and a database routing structure in place to be able
to easily expand on the API structure and easily
create new data calls.

Moreover, there is no way to
update data as necessary and no security in place
to limit who can view this data. I think that in a
financial field, we will definitely have to be
keeping security in the forefront of our minds. As
for updating data, while I am not sure what that may
look like in general with credit limits, I think that
creating some sort of interface to add new banks,
assess risk, update assets, etc. could be included
in order to make this a one-stop-shop kind of app.

### The Front End
This front end is extremely rudimentary. My front
end experience has largely come from React and so I
am quite partial to it.

As I mentioned above, I think that this platform
could be one-stop-shop kind of app. React would be
so perfect for that sort of thing because a dev can
so easily create a single web page application and
that is all you need for this. It could even be
handled without needing to rely on Redux.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
