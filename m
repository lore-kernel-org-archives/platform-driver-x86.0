From: Nitin Joshi1 <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [External] Re: [PATCH v4] platform/x86:
 thinkpad_acpi: lap or desk mode interface
Date: Mon, 27 Jul 2020 02:51:09 +0000
Message-ID: <SG2PR03MB2718DFC08C4ECF7816D1B4E48C720@SG2PR03MB2718.apcprd03.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20200629191748.3859-1-markpearson@lenovo.com>
 <732277929.1313334.1593596757447.JavaMail.zimbra@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <732277929.1313334.1593596757447.JavaMail.zimbra-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Bastien Nocera <bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark RH Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Cc: Sugumaran Lacshiminarayanan <slacshiminar-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, "platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org" <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, "ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Hello Bastien

>-----Original Message-----
>From: Bastien Nocera <bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

>----- Original Message -----
>> Newer Lenovo Thinkpad platforms have support to identify whether the
>>   system is on-lap or not using an ACPI DYTC event from the firmware.
>>
>>   This patch provides the ability to retrieve the current mode via sysfs
>>   entrypoints and will be used by userspace for thermal mode and WWAN
>>   functionality
>>
>> Co-developed-by: Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
>> Reviewed-by: Sugumaran <slacshiminar-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
>
>
>You can add my:
>Reviewed-by: Bastien Nocera <bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

It's already added in latest patch and currently in "for-next"
http://git.infradead.org/linux-platform-drivers-x86.git/commit/acf7f4a59114471c3964f118564fe8e7a6f34bb8

Thanks 
