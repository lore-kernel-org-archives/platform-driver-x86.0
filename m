From: Alex Hung <alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH] thinkpad_acpi: added BIOS mute
	interfaces for volume
Date: Sun, 08 Jul 2012 23:29:48 +0800
Message-ID: <4FF9A76C.7030308@canonical.com>
References: <1334139302-7152-1-git-send-email-alex.hung@canonical.com>
	<4F855A2B.6070402@canonical.com>
	<20120411114211.GA11445@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20120411114211.GA11445-ZGHd14iZgfaRjzvQDGKj+xxZW9W5cXbT@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

I saw a number of discussion on new thinkpad led and caused me to 
re-think about my previous patch.

The previous patches add interfaces to control hardware mute via BIOS 
functions; however there are nobody to control it and the problem of 
out-of-sync between hardware mute and software mute will still exist.

Will it be a better idea to disable hardware mute? The hardware mute 
will still send a scancode to mute the volue when thinkpad-acpi is 
loaded, though the led will still not work. More specifically, a patch 
that only calls with hoteky_set_mute_support(1) that works as below:


+static int hotkey_set_mute_support(int support)
+{
+	int output;
+
+	if (!acpi_evalf(hkey_handle, &output, "SHDA", "dd", support))
+		return -EIO;
+
+	if (output & TPACPI_AML_MUTE_ERROR_STATE_MASK) {
+		pr_warning("setting mute support failed.\n");
+		return -EIO;
+	}
+	pr_info("%s mute led support.\n", support ? "disable" : "enable");
+
+	return 0;
+}

This can solve the problems that unmute from desktop will not unmute the 
hardware mute until someone including myself works out a more 
comprehensive solution.

Best Regards,
Alex Hung


On 04/11/2012 07:42 PM, Henrique de Moraes Holschuh wrote:
> On Wed, 11 Apr 2012, Alex Hung wrote:
>> I am modifying thinkpad_acpi so it can support the mute led, and I
>> am looking for suggestions and feedbacks.
>>
>> For newer BIOS, it includes three aml methods that can be used to
>> get, set and enable the mute led.
>
> Aha!  THANK YOU.
>
> I will look at the patches this week.  Please send me (directly) a full
> dmidecode and ACPI table dump.
>



------------------------------------------------------------------------------
Live Security Virtual Conference
Exclusive live event will cover all the ways today's security and 
threat landscape has changed and how IT managers can respond. Discussions 
will include endpoint security, mobile security and the latest in malware 
threats. http://www.accelacomm.com/jaw/sfrnl04242012/114/50122263/
