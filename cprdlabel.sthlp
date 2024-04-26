{smcl}
{* *! version 1.1  26apr2024}{...}
{findalias asfradohelp}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[R] help" "help help"}{...}
{viewerjumpto "Syntax" "cprdlabel##syntax"}{...}
{viewerjumpto "Description" "cprdlabel##description"}{...}
{viewerjumpto "Options" "cprdlabel##options"}{...}
{viewerjumpto "Remarks" "cprdlabel##remarks"}{...}
{viewerjumpto "Examples" "cprdlabel##examples"}{...}
{title:Title}

{phang}
{bf:cprdlabel} {hline 2} Label CPRD categorical variables using the provided lookup


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:cprdlabel}
{varname}{cmd:,}
{opth lookup(string)}
{opth loc:ation(string)}

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opt lookup(string)}}The name of the lookup file{p_end}
{synopt:{opt loc:ation(string)}}The directory containing the label lookups{p_end}
{synoptline}
{p2colreset}{...}


{marker description}{...}
{title:Description}

{pstd}
{cmd:cprdlabel} labels the categorical variable {varname} using the lookup
provided by CPRD. The lookup for each categorical variable can be found in the
CPRD data specification available from:
{browse "https://cprd.com/primary-care-data-public-health-research"}.


{marker options}{...}
{title:Options}

{dlgtab:Main}

{phang}
{opt lookup(string)} specifies the name of the lookup file to use for {varname}.
Do not include the file extension (e.g. .txt).

{phang}
{opt location(string)} specifies the directory that the lookup is contained in.


{marker remarks}{...}
{title:Remarks}

{pstd}
Stata has a limit of 65,536 individual labels within each defined label.
{cmd:cprdlabel} therefore does not work with the "ConsSource" lookup.


{marker examples}{...}
{title:Examples}

{phang}{cmd:. cprdlabel gender, lookup("Gender") location("Z:\Aurum_Lookups_Feb_2022")}{p_end}

{phang}{cmd:. cprdlabel gender, lookup("Gender") location("`lookup_path'")}{p_end}
