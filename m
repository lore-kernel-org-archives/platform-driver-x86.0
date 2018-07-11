From: Jouke Witteveen <j.witteveen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] platform/x86: thinkpad_acpi:
 Proper model/release matching
Date: Wed, 11 Jul 2018 14:14:42 +0200
Message-ID: <CAJ2ouaxA0J8LOXUgFj26c-bB+qJerxykoSOiWeiLiMjweit-rg@mail.gmail.com>
References: <20180711094441.GA3240@Mindship-05.localdomain>
 <20180711120554.6xsrd3tzof6jpxd6@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20180711120554.6xsrd3tzof6jpxd6-ZGHd14iZgfaRjzvQDGKj+xxZW9W5cXbT@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org
Cc: dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 11, 2018 at 2:06 PM Henrique de Moraes Holschuh
<hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org> wrote:
>
> On Wed, 11 Jul 2018, Jouke Witteveen wrote:
> > Modern Thinkpads have three character model designators. Previously, they
> > would be accepted, but recorded incompletely. Revision matching extracted
> > the wrong bytes from the ID string. This made the use of quirks for modern
> > machines impossible.
> >
> > Fixes: 1b0eb5bc2413
> > Signed-off-by: Jouke Witteveen <j.witteveen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> In which thinkpad models did you test this?  It would be interesting
> to have that in the commit message, please.  It needs to be tested on a
> two-char and a three-char model.
>
> If necessary, I can test on a T43 if you don't have a two-char model
> around, but that might take a few days.
>

I tested on a Thinkpad 13 (cf. the other patch). Unfortunately, I have
no other Thinkpads available and indeed I did not test on any two-char
models. A test on a T43 would be highly appreciated.
In particular, it would be nice to test whether the quirks mechanism
still functions correctly on the two-char models. I see that there are
quirks for leds and brightness in place for the T43.

Thanks,
- Jouke

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
