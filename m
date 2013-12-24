From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] dell-laptop: Only install the i8042 filter when rfkill
 is active
Date: Tue, 24 Dec 2013 20:35:41 +0100
Message-ID: <52B9E20D.6080902@redhat.com>
References: <1387913641-7498-1-git-send-email-hdegoede@redhat.com> <1387913641-7498-2-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:22085 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752360Ab3LXTfq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Dec 2013 14:35:46 -0500
In-Reply-To: <1387913641-7498-2-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Hi,

On 12/24/2013 08:34 PM, Hans de Goede wrote:
> Installing the i8042 filter is not useful on machines where rfkill is not
> whitelisted, so move the filter installation into dell_setup_rfkill,
> after the whitelist check.

p.s.

Note the cleanup paths are not changed, I did not bother with tracking
if we have installed the filter and only calling i8042_remove_filter if
we have, because i8042_remove_filter is a nop of the passed in filter
is not installed.
