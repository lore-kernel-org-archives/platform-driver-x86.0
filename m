From: Len Brown <lenb@kernel.org>
Subject: Re: [PATCH 2/2] ACPI video: add initial blacklist to use vendor
 drivers for backlight
Date: Mon, 11 Apr 2011 23:40:31 -0400 (EDT)
Message-ID: <alpine.LFD.2.02.1104112338350.2439@x980>
References: <1295376114-5685-1-git-send-email-herton@mandriva.com.br>
 <1295376114-5685-2-git-send-email-herton@mandriva.com.br>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from vms173019pub.verizon.net ([206.46.173.19]:63881 "EHLO
	vms173019pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756386Ab1DLDkh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Apr 2011 23:40:37 -0400
In-reply-to: <1295376114-5685-2-git-send-email-herton@mandriva.com.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Herton Ronaldo Krzesinski <herton@mandriva.com.br>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, Matthew Garrett <mjg@redhat.com>


> +		/*if (dmi_check_system(output_switching_vendor_dmi_table))
> +			acpi_video_support |=
> +				ACPI_VIDEO_OUTPUT_SWITCHING_DMI_VENDOR;*/

please exclude this comment.

thanks,
-Len
