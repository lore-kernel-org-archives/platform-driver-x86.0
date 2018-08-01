From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] platform/x86: thinkpad_acpi:
 Proper model/release matching
Date: Wed, 1 Aug 2018 13:25:52 +0300
Message-ID: <CAHp75VcnZ_2CrDpJCTwP1T10jq18v9mutpJeCCkrd0fuqsQJ5Q@mail.gmail.com>
References: <20180801092245.GA10937@Mindship-05.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20180801092245.GA10937-7Pk1HLXsvWqf6HGZUO+WniZi+YwRKgec@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Jouke Witteveen <j.witteveen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 1, 2018 at 12:22 PM, Jouke Witteveen <j.witteveen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Modern Thinkpads have three character model designators. Previously, they
> would be accepted, but recorded incompletely. Revision matching extracted
> the wrong bytes from the ID string. This made the use of quirks for modern
> machines impossible.
>
> Fixes: 1b0eb5bc2413
> Signed-off-by: Jouke Witteveen <j.witteveen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>
> This has now been tested on both 3-character models (Thinkpad 13) and two
> character models (Thinkpad 11e).
> The part one of this series is identical to the previously submitted patch.

The patches you submitted before had been applied.
Please, rebase your stuff against our for-next branch and resend.

-- 
With Best Regards,
Andy Shevchenko

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
