From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH 1/4] acer-wmi: does not allow negative number set to initial device state
Date: Sun, 22 May 2011 00:38:19 +0100
Message-ID: <201105220038.19817.carlos@strangeworlds.co.uk>
References: <1306020834-5186-1-git-send-email-jlee@novell.com> <1306020834-5186-2-git-send-email-jlee@novell.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:53059 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750963Ab1EUXit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 21 May 2011 19:38:49 -0400
Received: by wya21 with SMTP id 21so3455318wya.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 May 2011 16:38:48 -0700 (PDT)
In-Reply-To: <1306020834-5186-2-git-send-email-jlee@novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

On Sunday 22 May 2011 00:33:51 Lee, Chun-Yi wrote:
> The driver set module parameter value: mailled, threeg and brightness
> to BIOS by evaluate wmi method when driver was initialled. The default
> values for those parameters are -1, so, that will be better don't set
> negative value to BIOS.
> 
> Reference: bko#32862
>         https://bugzilla.kernel.org/show_bug.cgi?id=32862
> 
> Tested on Acer Aspire 8930G, Acer Travelmate 8572
> 
> Tested-by: Hector Martin <hector@marcansoft.com>

Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

-Carlos
