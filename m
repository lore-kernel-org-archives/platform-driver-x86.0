From: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [External] Re: [PATCH v5] platform/x86:
 thinkpad_acpi: lap or desk mode interface
Date: Mon, 3 Aug 2020 12:15:52 -0400
Message-ID: <4481e959-7e13-fb11-0628-9509380d38ee@lenovo.com>
References: <CAHms=eZm3LY-Z4p+TkfZ+vyxGd_7XKPBsSEM_Mvnx2s-GO2c9w@mail.gmail.com>
 <CAHms=eYpcy__Km_9O4MUtLxpasH1sAgQEmcapOhV79j01twhow@mail.gmail.com>
 <0e462361-a3bc-a7b8-bacd-85f32b575bac@lenovo.com>
 <CAHms=eZ4YVAvmUsjcZTsPOf15sxK_vELbK6fvCs=Bbm3gxFGeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <CAHms=eZ4YVAvmUsjcZTsPOf15sxK_vELbK6fvCs=Bbm3gxFGeQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Elvis Stansvik <elvstone-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sugumaran <slacshiminar-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, Bastien Nocera <bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org



On 8/3/2020 10:46 AM, Elvis Stansvik wrote:

> 
> Thanks Mark. I know the X1C6 firmware did not get the new thermal
> mode implementation, but thought that I would still be able to query
> its lap mode.
> 
> The reason I wanted query the lap mode is actually because I'm
> trying to help Matthew Garrett out in adding support for the adaptive
> DPTF performance policy on the thermald side, instead of on the
> firmware side like Lenovo decided to do for more recent models. See
> that effort here https://github.com/mjg59/thermal_daemon/issues/7).
> We were surprised to find that all of the OEM conditions in the APCT
> table remained unchanged when the laptop was taken between lap and
> desk. So I started suspecting that perhaps the X1C6 and its firmware
> simply does not have the ability to detect lap vs desk. That's why I
> wanted to use this patch to query the lap mode, as a debugging aid.
> 
> If X1C6 does not have the ability to detect lap mode, then that
> would obviously explain why the firmware does not change any APCT
> condition when put on/off lap, and any effort to get adaptive
> performance policy working on the thermald side is probably doomed
> :(
> 
Just as a follow-up for this mailing list - I responded to the X1C6 
issues on the thermal_daemon thread mentioned above - I will track those 
there.

Anything related to the thinkpad_acpi driver and improvements needed to 
my previous patch will come here. I have a question in to the firmware 
team to understand the limitations of when the lapmode variable should 
be made available or not. Looks like I have some work to do there....

Thanks!
Mark
