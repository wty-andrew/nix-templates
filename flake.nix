{
  description = "A collection of flake templates";

  outputs = { self }: {
    templates = {
      cpp = {
        path = ./cpp;
        description = "Template for a C++ project";
      };

      rust = {
        path = ./rust;
        description = "Template for a rust project";
      };
    };
  };
}
