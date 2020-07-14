From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1] platform/x86: thinkpad_acpi: Limit
 size when call strndup_user()
Date: Tue, 14 Jul 2020 15:29:03 +0200
Message-ID: <6920cff7-ab7c-a4ef-4f8f-83966b7bf498@redhat.com>
References: <20200714104250.87970-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20200714104250.87970-1-andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 7/14/20 12:42 PM, Andy Shevchenko wrote:
> During conversion to use strndup_user() the commit 35d13c7a0512
> ("platform/x86: thinkpad_acpi: Use strndup_user() in dispatch_proc_write()")
> missed the fact that buffer coming thru procfs is not immediately NULL
> terminated. We have to limit size when calling strndup_user().
> 
> Fixes: 35d13c7a0512 ("platform/x86: thinkpad_acpi: Use strndup_user() in dispatch_proc_write()")
> Reported-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>   drivers/platform/x86/thinkpad_acpi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index f571d6254e7c..f411ad814cab 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -886,7 +886,7 @@ static ssize_t dispatch_proc_write(struct file *file,
>   	if (!ibm || !ibm->write)
>   		return -EINVAL;
>   
> -	kernbuf = strndup_user(userbuf, PAGE_SIZE);
> +	kernbuf = strndup_user(userbuf, min_t(long, count, PAGE_SIZE));
>   	if (IS_ERR(kernbuf))
>   		return PTR_ERR(kernbuf);
>   
> 

This is not going to work:

char *strndup_user(const char __user *s, long n)
{
         char *p;
         long length;

         length = strnlen_user(s, n);

         if (!length)
                 return ERR_PTR(-EFAULT);

         if (length > n)
                 return ERR_PTR(-EINVAL);


And strnlen_user is:

#ifndef __strnlen_user
#define __strnlen_user(s, n) (strnlen((s), (n)) + 1)
#endif

/*
  * Unlike strnlen, strnlen_user includes the nul terminator in
  * its returned count. Callers should check for a returned value
  * greater than N as an indication the string is too long.
  */
static inline long strnlen_user(const char __user *src, long n)
{
         if (!access_ok(src, 1))
                 return 0;
         return __strnlen_user(src, n);
}

So strnlen_user returns (n + ) for a string which is n bytes
longs, so:

         length = strnlen_user(s, n);

Will set length = n + 1, and then this check triggers:

         if (length > n)
                 return ERR_PTR(-EINVAL);

Because n + 1 > n, I also build the module with your patch
and as expected I get:

[root@x1 ~]# echo -n 0 > /proc/acpi/ibm/lcdshadow
-bash: echo: write error: Invalid argument

Note you also cannot pass count+1 because then strnlen will
return count+1 if there is no terminating 0 after count bytes
and strnlen_user will return count + 1 + 1 and we still hit
the same check (and we are trying to consume one byte too much).

Can we please just go with the revert for now?

Regards,

Hans
