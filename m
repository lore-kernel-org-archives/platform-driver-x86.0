From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH V2 2/3] integrity: Move import of MokListRT certs to a
 separate routine
Date: Fri, 11 Sep 2020 15:08:38 -0400
Message-ID: <06ea64fec71ebd18f0c5ed6b0d9b5a7d8f1d4775.camel@linux.ibm.com>
References: <20200905013107.10457-1-lszubowi@redhat.com>
         <20200905013107.10457-3-lszubowi@redhat.com>
         <CAMj1kXEdkdeE8VSZqEzhd__Kb7_ZmG2af6iBpbY3=nsj1-phYw@mail.gmail.com>
         <f0a079b1-5f02-8618-fdfe-aea2278113c9@redhat.com>
         <cb8b4ebaa35d79eba65b011d042d20a991adf540.camel@linux.ibm.com>
         <394190b9-59bd-5cb3-317e-736852f190f4@redhat.com>
         <CAMj1kXEz8y+X6KjqWWFD=38dDowqXDBvnPbgeh30+o83KpmKrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <CAMj1kXEz8y+X6KjqWWFD=38dDowqXDBvnPbgeh30+o83KpmKrg@mail.gmail.com>
Sender: owner-linux-security-module@vger.kernel.org
To: Ard Biesheuvel <ardb@kernel.org>, Lenny Szubowicz <lszubowi@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-efi <linux-efi@vger.kernel.org>, platform-driver-x86@vger.kernel.org, linux-security-module@vger.kernel.org, andy.shevchenko@gmail.com, James Morris <jmorris@namei.org>, serge@hallyn.com, Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@alien8.de>, Peter Jones <pjones@redhat.com>, David Howells <dhowells@redhat.com>, prarit@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 2020-09-11 at 21:16 +0300, Ard Biesheuvel wrote:
> I think we can just merge the patches as they are, with Mimi's R-b carried over.

Other than the comments beginning on the "/*" line as opposed to the
subsequent line, the updated 2/2 and 3/3 patches look fine.

thanks,

Mimi
