From: Bastien Nocera <bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4] platform/x86: thinkpad_acpi: lap or
 desk mode interface
Date: Wed, 1 Jul 2020 05:45:57 -0400 (EDT)
Message-ID: <732277929.1313334.1593596757447.JavaMail.zimbra@redhat.com>
References: <markpearson@lenovo.com>
 <20200629191748.3859-1-markpearson@lenovo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20200629191748.3859-1-markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Cc: Sugumaran <slacshiminar-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org



----- Original Message -----
> Newer Lenovo Thinkpad platforms have support to identify whether the
>   system is on-lap or not using an ACPI DYTC event from the firmware.
> 
>   This patch provides the ability to retrieve the current mode via sysfs
>   entrypoints and will be used by userspace for thermal mode and WWAN
>   functionality
> 
> Co-developed-by: Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Sugumaran <slacshiminar-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>


You can add my:
Reviewed-by: Bastien Nocera <bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Cheers
