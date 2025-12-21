abstract class IMapper<Dto, Domain> {
  Domain dtoToDomain(Dto dto);
}