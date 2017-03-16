From: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] x86: thinkpad_acpi: Handle return
	error.
Date: Wed, 15 Mar 2017 17:28:19 -0700
Message-ID: <20170316002819.GA11351@fury>
References: <1488786206-20190-1-git-send-email-arvind.yadav.cs@gmail.com>
	<CAHp75VcY2D3E3ogT_ySTVo8C5j17EYDXqn0mi0DEmkVqntwZPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VcY2D3E3ogT_ySTVo8C5j17EYDXqn0mi0DEmkVqntwZPA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Arvind Yadav <arvind.yadav.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 06, 2017 at 10:45:50AM +0200, Andy Shevchenko wrote:
> On Mon, Mar 6, 2017 at 9:43 AM, Arvind Yadav <arvind.yadav.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > This patch is for handling a return error.
> >
> > Signed-off-by: Arvind Yadav <arvind.yadav.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/platform/x86/thinkpad_acpi.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> > index 1d18b32..19ad3ec 100644
> > --- a/drivers/platform/x86/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/thinkpad_acpi.c
> > @@ -1237,9 +1237,11 @@ static int tpacpi_rfk_hook_set_block(void *data, bool blocked)
> >         /* try to set radio state */
> 
> >         res = (tp_rfk->ops->set_status)(blocked ?
> >                                 TPACPI_RFK_RADIO_OFF : TPACPI_RFK_RADIO_ON);
> 
> Just in case: first parens are redundant here.
> 
> > +       if (res < 0)
> > +               return res;
> 
> So, this changes behaviour. Before we call _rfk_update_swstate()
> independently on error code.
> 
> Care to explain in commit message how this change does / does not
> affect overall user experience?

Arvind has made a number of similar such changes throughout the tree, I presume
with some automation. In this case, since there is no indication of a particular
manifestation of this bug on hardware, I will presume the same approach was
taken here. I'm dropping this patch as "changes requested" because at the very
least this needs a commit log which documents the problem manifested and why the
behavioral change is appropriate.

-- 
Darren Hart
VMware Open Source Technology Center

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
