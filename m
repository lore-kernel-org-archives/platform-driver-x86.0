From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 1/2] X86 platform wmi: Introduce debug param to log all
	WMI events
Date: Mon, 3 May 2010 14:07:56 +0200
Message-ID: <y2u71cd59b01005030507zdeb6db98r7d6620cf44453d75@mail.gmail.com>
References: <1272877808-13468-1-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f219.google.com ([209.85.218.219]:41807 "EHLO
	mail-bw0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758181Ab0ECMH6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 3 May 2010 08:07:58 -0400
Received: by bwz19 with SMTP id 19so1244004bwz.21
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 May 2010 05:07:56 -0700 (PDT)
In-Reply-To: <1272877808-13468-1-git-send-email-trenn@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>
Cc: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

On Mon, May 3, 2010 at 11:10 AM, Thomas Renninger <trenn@suse.de> wrote:
> To give people easily an idea what could be WMI driven on their system.
> Introduces:
> wmi.debug=[01]
> ...
> +MODULE_PARM_DESC(debug,
> +                "Debug facility to log WMI Events [0/1]");
> +

I'm ok with the base idea, but as this debug option is event specific,
maybe it should be called debug_events ?

Or we can call it debug, change the param description ("add
verbosity/debug messages to the wmi driver" for example)
and also dump all guids (like I do in wmidump).


-- 
Corentin Chary
http://xf.iksaif.net
