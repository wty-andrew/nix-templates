{
  description = "A collection of flake templates";

  outputs = { self }: {
    templates = {
      cpp = {
        path = ./cpp;
        description = "Template for a C++ project";
      };

      python = {
        path = ./python;
        description = "Template for a python project";
      };

      rust = {
        path = ./rust;
        description = "Template for a rust project";
      };

      scala = {
        path = ./scala;
        description = "Template for a scala project";
      };

      typescript = {
        path = ./typescript;
        description = "Template for a typescript project";
      };
    };
  };
}
