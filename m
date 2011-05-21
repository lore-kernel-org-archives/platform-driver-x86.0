From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH 2/4] acer-wmi: check the existence of internal 3G device when set capability
Date: Sun, 22 May 2011 00:43:58 +0100
Message-ID: <201105220043.58857.carlos@strangeworlds.co.uk>
References: <1306020834-5186-1-git-send-email-jlee@novell.com> <1306020834-5186-2-git-send-email-jlee@novell.com> <1306020834-5186-3-git-send-email-jlee@novell.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:38261 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751871Ab1EUXo2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 21 May 2011 19:44:28 -0400
Received: by wya21 with SMTP id 21so3456482wya.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 May 2011 16:44:27 -0700 (PDT)
In-Reply-To: <1306020834-5186-3-git-send-email-jlee@novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

On Sunday 22 May 2011 00:33:52 Lee, Chun-Yi wrote:
> That will be better to check the existence of internal 3G device when
> we set threeg capability and generate killswitch for threeg. It can
> avoid userland access 3G rfkill but the machine doesn't have internal
> 3G device.
> 
> Reference: bko#32862
> 	https://bugzilla.kernel.org/show_bug.cgi?id=32862
> 
> Tested on Acer Aspire 8930G, Acer Travelmate 8572
> 
> Tested-by: Hector Martin <hector@marcansoft.com>

Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

If you can now autodetect 3G and already have the relevant rfkill device, then 
you should also rip out the remaining sysfs support for it as it's no longer 
necessary.

-Carlos
