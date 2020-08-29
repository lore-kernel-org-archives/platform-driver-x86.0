From: Denis Efremov <efremov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
Subject: Re: sysfs output without newlines
Date: Sat, 29 Aug 2020 23:23:39 +0300
Message-ID: <4cd6275c-6e95-3aeb-9924-141f62e00449@linux.com>
References: <0f837bfb394ac632241eaac3e349b2ba806bce09.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0f837bfb394ac632241eaac3e349b2ba806bce09.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "Rafael J. Wysocki" <rafael-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "Gustavo A . R . Silva" <gustavoars-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julia Lawall <julia.lawall-MZpvjPyXg2s@public.gmane.org>, Alex Dewar <alex.dewar90-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tony Luck <tony.luck-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Boris Brezillon <bbrezillon-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alex Dubov <oakad-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomas Winkler <tomas.winkler-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Douglas Miller <dougmill-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Stanislav Yakovlev <stas.yakovlev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, An
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 8/29/20 9:23 PM, Joe Perches wrote:
> While doing an investigation for a possible treewide conversion of
> sysfs output using sprintf/snprintf/scnprintf, I discovered
> several instances of sysfs output without terminating newlines.
> 
> It seems likely all of these should have newline terminations
> or have the \n\r termination changed to a single newline.

I think that it could break badly written scripts in rare cases.

> 
> Anyone have any objection to patches adding newlines to these
> in their original forms using sprintf/snprintf/scnprintf?

I'm not sure about existing cases, but I think it's a good
checkpatch.pl warning for new patches. It should be 
possible to check sysfs_emit() calls.

Thanks,
Denis
