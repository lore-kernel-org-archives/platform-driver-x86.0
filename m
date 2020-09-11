From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH V2 2/3] integrity: Move import of MokListRT certs to a
 separate routine
Date: Fri, 11 Sep 2020 11:59:07 -0400
Message-ID: <cb8b4ebaa35d79eba65b011d042d20a991adf540.camel@linux.ibm.com>
References: <20200905013107.10457-1-lszubowi@redhat.com>
         <20200905013107.10457-3-lszubowi@redhat.com>
         <CAMj1kXEdkdeE8VSZqEzhd__Kb7_ZmG2af6iBpbY3=nsj1-phYw@mail.gmail.com>
         <f0a079b1-5f02-8618-fdfe-aea2278113c9@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <f0a079b1-5f02-8618-fdfe-aea2278113c9@redhat.com>
Sender: owner-linux-security-module@vger.kernel.org
To: Lenny Szubowicz <lszubowi@redhat.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-efi <linux-efi@vger.kernel.org>, platform-driver-x86@vger.kernel.org, linux-security-module@vger.kernel.org, andy.shevchenko@gmail.com, James Morris <jmorris@namei.org>, serge@hallyn.com, Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@alien8.de>, Peter Jones <pjones@redhat.com>, David Howells <dhowells@redhat.com>, prarit@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 2020-09-11 at 11:54 -0400, Lenny Szubowicz wrote:
> On 9/11/20 11:02 AM, Ard Biesheuvel wrote:
> > On Sat, 5 Sep 2020 at 04:31, Lenny Szubowicz <lszubowi@redhat.com> wrote:
> >>
> >> Move the loading of certs from the UEFI MokListRT into a separate
> >> routine to facilitate additional MokList functionality.
> >>
> >> There is no visible functional change as a result of this patch.
> >> Although the UEFI dbx certs are now loaded before the MokList certs,
> >> they are loaded onto different key rings. So the order of the keys
> >> on their respective key rings is the same.
> >>
> >> Signed-off-by: Lenny Szubowicz <lszubowi@redhat.com>
> > 
> > Why did you drop Mimi's reviewed-by from this patch?
> 
> It was not intentional. I was just not aware that I needed to propagate
> Mimi Zohar's reviewed-by from V1 of the patch to V2.
> 
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> 
> V2 includes changes in that patch to incorporate suggestions from
> Andy Shevchenko. My assumption was that the maintainer would
> gather up the reviewed-by and add any signed-off-by as appropriate,
> but it sounds like my assumption was incorrect. In retrospect, I
> could see that having the maintainer dig through prior versions
> of a patch set for prior reviewed-by tags could be burdensome.

As much as possible moving code should be done without making changes,
simpler for code review.   Then as a separate patch you make changes.  
That way you could also have retained my Reviewed-by.

Mimi

> 
> Advice on the expected handling of this would be appreciated.
