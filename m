From: Aaron Lu <aaron.lu@intel.com>
Subject: Re: [PATCH 1/4] acpi-video: Don't register acpi_video_resume notifier
 without backlight devices
Date: Fri, 16 May 2014 10:25:52 +0800
Message-ID: <53757730.4080101@intel.com>
References: <1400152956-9053-1-git-send-email-hdegoede@redhat.com> <1400152956-9053-2-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:39282 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752316AbaEPCZz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 May 2014 22:25:55 -0400
In-Reply-To: <1400152956-9053-2-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>, Lee Chun-Yi <jlee@suse.com>
Cc: Zhang Rui <rui.zhang@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Massimiliano <massi.ergosum@gmail.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org

On 05/15/2014 07:22 PM, Hans de Goede wrote:
> If we're not going to be registering any backlight devices then
> acpi_video_resume is always nop, so don't register it in that case.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Aaron Lu <aaron.lu@intel.com>
