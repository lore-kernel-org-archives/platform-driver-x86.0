From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 0/4] support watchdog with longer timeout period
Date: Fri, 29 May 2020 16:12:03 -0700
Message-ID: <be4e03f9-8b20-6775-96cf-dc6d13027184@roeck-us.net>
References: <20200504141427.17685-1-michaelsh@mellanox.com>
 <ac2c580c-7cc0-8091-f3bc-fce175478e50@roeck-us.net>
 <CAHp75VdN6PfCCmRB_FssTRCoXms7JTt_af59pMqZNgV4ygz_8w@mail.gmail.com>
 <AM6PR05MB6168698F8A3D49F0EF61EFF0D9B70@AM6PR05MB6168.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AM6PR05MB6168698F8A3D49F0EF61EFF0D9B70-jHMdEEEsG3MP6j+F601k99qRiQSDpxhJvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wim Van Sebroeck <wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On 5/21/20 7:25 AM, Michael Shych wrote:
> Hi Andy, Guenter,
> 
> Did you understand to which branch it will be better to take this patchset?
> 

I created an immutable branch at
    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-mlx-immutable

Guenter

> Thanks,
>    Michael.
> 
>> -----Original Message-----
>> From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Sent: Tuesday, May 5, 2020 7:14 PM
>> To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>> Cc: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>; Wim Van Sebroeck <wim@linux-
>> watchdog.org>; Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>; Darren Hart
>> <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>; linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Platform Driver
>> <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>; Vadim Pasternak
>> <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
>> Subject: Re: [PATCH v4 0/4] support watchdog with longer timeout period
>>
>> On Tue, May 5, 2020 at 7:09 PM Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
>>> On 5/4/20 7:14 AM, michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org wrote:
>>>> From: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
>>
>>>> Michael Shych (4):
>>>>   platform_data/mlxreg: support new watchdog type with longer timeout
>>>>     period
>>>>   platform/x86: mlx-platform: support new watchdog type with longer
>>>>     timeout
>>>>   watchdog: mlx-wdt: support new watchdog type with longer timeout
>>>>     period
>>>>   docs: watchdog: mlx-wdt: Add description of new watchdog type 3
>>>>
>>>>  Documentation/watchdog/mlx-wdt.rst   |  10 ++++
>>>>  drivers/platform/x86/mlx-platform.c  | 106
>> ++++++++++++++++++++++++++++++
>>>>  drivers/watchdog/mlx_wdt.c           |  73 ++++++++++++++++++++----
>>>>  include/linux/platform_data/mlxreg.h |   5 +-
>>
>>> Guess the big question is now which branch to use to take this series.
>>> Thoughts, anyone ?
>>
>> count(watchdog) = 8
>> count(platform) = 6
>>
>> Thoughts?
>>
>> --
>> With Best Regards,
>> Andy Shevchenko
