
-- querry 1
select
	title,
    films.language_id,
    language.name


from films


left join language
on films.language_id = language.language_id
;
-- querry 2

select
	title,
    language.name as "idioma original"
   


from films


left join language
on films.original_language_id = language.language_id


;

-- querry 3
select
	films.title,
    HDD.category_id,
    category.name
    

from films

left join HDD
on films.title = HDD.title

left join category
on HDD.category_id =category.category_id

;
-- querry 4
select
	actores.coplete_name,
    count(HDD.title)
from actores

left join HDD
on actores.coplete_name = HDD.coplete_name

group by actores.coplete_name
order by count(HDD.title) desc
;

-- 5. Actores que saben hablar japones

select 
	actores.coplete_name


from actores

left join HDD
on actores.coplete_name = HDD.coplete_name

left join films
on HDD.title = films.title

left join language
on films.original_language_id = language.language_id

where
language.name = "Japanese"

group by 	actores.coplete_name


;







-- 6. Actores que mas idiomas hablan


select 
	actores.coplete_name,
    COUNT(DISTINCT(language.name))


from actores

left join HDD
on actores.coplete_name = HDD.coplete_name

left join films
on HDD.title = films.title

left join language
on films.original_language_id = language.language_id

group by actores.coplete_name

order by count(language.name) desc

;






