From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/3] integrity: Move import of MokListRT certs to a
 separate routine
Date: Wed, 2 Sep 2020 10:55:21 +0300
Message-ID: <CAHp75Vec0a3LC7dGY6wacQu0brc+Zjfowt6kGdcZ9sfMzoDR9g@mail.gmail.com>
References: <20200826034455.28707-1-lszubowi@redhat.com> <20200826034455.28707-3-lszubowi@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200826034455.28707-3-lszubowi@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lenny Szubowicz <lszubowi@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-efi <linux-efi@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>, Mimi Zohar <zohar@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, Peter Jones <pjones@redhat.com>, David Howells <dhowells@redhat.com>, Prarit Bhargava <prarit@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 26, 2020 at 6:45 AM Lenny Szubowicz <lszubowi@redhat.com> wrote:
>
> Move the loading of certs from the UEFI MokListRT into a separate
> routine to facilitate additional MokList functionality.
>
> There is no visible functional change as a result of this patch.
> Although the UEFI dbx certs are now loaded before the MokList certs,
> they are loaded onto different key rings. So the order of the keys
> on their respective key rings is the same.

...

>  /*
> + * load_moklist_certs() - Load MokList certs
> + *
> + * Returns:    Summary error status
> + *
> + * Load the certs contained in the UEFI MokListRT database into the
> + * platform trusted keyring.
> + */

Hmm... Is it intentionally kept out of kernel doc format?

> +static int __init load_moklist_certs(void)
> +{
> +       efi_guid_t mok_var = EFI_SHIM_LOCK_GUID;
> +       void *mok = NULL;
> +       unsigned long moksize = 0;
> +       efi_status_t status;
> +       int rc = 0;

Redundant assignment (see below).

> +       /* Get MokListRT. It might not exist, so it isn't an error
> +        * if we can't get it.
> +        */
> +       mok = get_cert_list(L"MokListRT", &mok_var, &moksize, &status);

> +       if (!mok) {

Why not positive conditional? Sometimes ! is hard to notice.

> +               if (status == EFI_NOT_FOUND)
> +                       pr_debug("MokListRT variable wasn't found\n");
> +               else
> +                       pr_info("Couldn't get UEFI MokListRT\n");
> +       } else {
> +               rc = parse_efi_signature_list("UEFI:MokListRT",
> +                                             mok, moksize, get_handler_for_db);
> +               if (rc)
> +                       pr_err("Couldn't parse MokListRT signatures: %d\n", rc);
> +               kfree(mok);

 kfree(...)
 if (rc)
  ...
 return rc;

And with positive conditional there will be no need to have redundant
'else' followed by additional level of indentation.

> +       }

> +       return rc;

return 0;

> +}

P.S. Yes, I see that the above was in the original code, so, consider
my comments as suggestions to improve the code.

-- 
With Best Regards,
Andy Shevchenko
