From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 1/3] X86 platform wmi: Introduce debug param to log all
	WMI events
Date: Tue, 4 May 2010 13:54:44 +0200
Message-ID: <q2g71cd59b01005040454xde9c0aabq3d997f8ef157891c@mail.gmail.com>
References: <1272893417-3481-1-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f217.google.com ([209.85.218.217]:51421 "EHLO
	mail-bw0-f217.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751937Ab0EDLyq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 4 May 2010 07:54:46 -0400
Received: by bwz9 with SMTP id 9so2085196bwz.29
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 May 2010 04:54:44 -0700 (PDT)
In-Reply-To: <1272893417-3481-1-git-send-email-trenn@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>
Cc: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org, Carlos Corbacho <carlos@strangeworlds.co.uk>

On Mon, May 3, 2010 at 3:30 PM, Thomas Renninger <trenn@suse.de> wrote:
> To give people easily an idea what could be WMI driven on their system.
> Introduces:
> wmi.debug=[01]
>
> Tested on an acer:
> ACPI: WMI: DEBUG Event INTEGER_TYPE - 65535
>
> Situation where a driver registers for specific event and debug
> handler gets overridden and set again if the registering driver gets
> unloaded again is untested, but should work.
>
> Signed-off-by: Thomas Renninger <trenn@suse.de>
> CC: platform-driver-x86@vger.kernel.org
> CC: mjg59@srcf.ucam.org
> CC: corentin.chary@gmail.com

CCing wmi.c maintainer.

-- 
Corentin Chary
http://xf.iksaif.net
