Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792895930;
	b=j5FTDBoVaDUbU6C1tMQsnK75ElXNDe06/uRO/tu+RAXKJUJDeBP53qp9VaMfXM6iuT1a
	 f5QACe/Vg4NjydcqpeCECT6hEExnn5s6zZZuiOAMJfzy1mNVDcgUG4/FnBhEj3DIidBAv
	 ZChPfc9eMiLH+UiKDKXgFFyyt7oMF43+BXvNM5KdoC9S2VDCjpaBWwBjHdiDZfGsLckb6
	 qRIN29SmghMw3yYq7E6sXjd06Ja/Z2lc/+Ht7rlxCN8sjzECd6EkPMGMiqXbtNoXnPiIp
	 eL3MpGzRB/R5dupibwU+8+6nXObm8oyVU6Bal6K30ET0/vYbd02ZGQ8TJyjP6Cd8Rig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792895930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=dflo9Yio8r83UnlnUmpgKhh7+70T4UxxCiY1S2zSEiQ=;
	b=vit9NKIM1jnEVjh8cYd/TlgXiPbtinW56LW56t2UVDsXbm8eJkpl05FqjqQ3VGuUaDxM
	 p5krnDgoqyioAVKJht1Y/4qXP8KtxpxZQp0rK0mLo2XQjkMi6HGTAi+MHmlJh5BNCUxQ8
	 d7gv34R93VZhYvT+SPL5JZVHkfXAtVrBbe19iUzpaoYzI3bWrEJ9wTBBrAaEI5tYtFp20
	 uCmzjgoGkm3XIwiup+yYPPUdC4ijXjbvZjbWZ5Fb+Qgp0TcDGfDjjlKJbjWT5ac6ZW4rY
	 Drk1j5j/8gR8gy4eo8HyxT6vHQSgcGz/r4pJWAAvUxJy5tQNpOtq2ZWArJplpdNAQlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="V/l16pyh";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EFC606A31A
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 02:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01EFC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V/l16pyh
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3860997eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 19:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792895929; x=1793500729; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dflo9Yio8r83UnlnUmpgKhh7+70T4UxxCiY1S2zSEiQ=;
        b=V/l16pyhDwJpYItIN83XuiFQivIFKwHhhAwJ161uHWgFb67I/T1lzBGrycHLy1GeNM
         3mYUmfsx8sSHGQn6eEdyo1VZx1K4bNXOm7LL3pfenIHyij22AnW7JrIFFuh8PUcX6t0A
         cRKgG/LrioM88XW4XxB8rOPT8Y8K4zjKkehoIHMCAT2T7+xSX4N+SjHo48D2fcjPAZSu
         FGYA/ZqD0b9rJoxtnl8I7NaVTfiULiGLckr1JXFQSzV3zw0g+lvDW7kMx/5QJKD/jo2g
         I2MiKXfPJsnRjveIqYkAQw67oq6Vi4Pu1fqatFvu50oClERzYifBDOGcd3utLfblYuyK
         nCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792895929; x=1793500729;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dflo9Yio8r83UnlnUmpgKhh7+70T4UxxCiY1S2zSEiQ=;
        b=yCP3R29uRYhOEstHKiPU9tYKwNeOAV0BXczdxRmh6bZPbInew01iQC/wMHhFEeOC0f
         dYNpFFsiQdqC/sF0wG82NsP+LAQYY1SwPFNDFg543VFtgDj6YNp7AyFcOydBYD0oH0qM
         T/gjfNsqIgTOwNvdFyYzR9oZOoZ0Varwp5zuFb1mltw3HpxjCp6a0zmccYQqyNVyamGU
         jSfJ3lAzpO+pjoxKBAxxjSe4EEo+TuQXyLzWaLnhuc5htXmRq9cBFfl3wLNjIM9XdV28
         hG+BcVVjBkGmQvGfIn58EaYe8gWQcXhCLAgPAoEz7h55vFM70DJ25lUt37EbeT/sDUon
         xWzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxl9zlfYrLztaaEtGReNB1v7fo7GOBMDPw5m3yLutr6oNYn6K9xKMWKg2J+UPlcsyOP/hGlVwfcPThHu6Qs+Hg1jBol@vger.kernel.org
X-Gm-Message-State: AFq9FYLCIczS6u/IndBB37yojDkDSlMe51jZJMoPuNNVIl5ywasyCt7t
	sfcguJEO4l5TX6f3tIf5+8EcVcXFQqWpXybdYE/GFdV+Y7b91lfxCizU
X-Gm-Gg: AYBFou0SjiYb64z/jkaQ714GLr9lS9nTab29TeIeH8wFxu6XPLbpLWL4oYKBz2oQEPl
	sXHwUEN8D9QM1fUvMbJ68s8govfvQa2zu/096lmR/BsGsveYuiLPdFr8ACW8a2Atfe5evt3uQRh
	J8i72FyTMosvi7n09+32UtYFzwkQ/pkzH90N30tlh4Owjez1nYQmxxdx5VxbYe0B23Tok62YA1e
	zZ/BW1gairTV67S8FCkgTbntRIFS8IZF7OnKcepc9XMl9ylwzDRr4WhyJIvioodOqjW5G1racBT
	GifMC+ARkHScsM0EmXtqRoKkPY4Uu0yeTP7wtOCUidBTao3dCHqdTZftHkE6LZJfDGNbdzwGipT
	ykt9mPRvi+8ye6+JPQuJCuHMkbP69RrGianyKkTVY/6OyLJGsyEq3pq3Q7mbKp9GnrBsTpRraDl
	j7B5yrxJu9Kv/NA3x8adbECH3+uNHXG0LXUcyqEOZ998t/kfDa4kj5kmtbwX7ZMbJZW5E8lK5/u
	feBkrwWXDCWRksy2RqzcNrTRPcCwJAMVhyY5heQsz+VKSKsJmJE2gL3Bg6YpxMCMcUVW4Q/TXyl
	AG4NCqG06hMYSEx+rd4U2RVA8yyK0DM8jfv3weQFew==
X-Received: by 2002:a05:693c:88c1:10b0:366:83dd:4704 with SMTP id 5a478bee46e88-369e84ff9f8mr4909251eec.17.1792895928963;
        Sat, 24 Oct 2026 19:38:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec864fsm13867225eec.24.2026.10.24.19.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:38:48 -0700 (PDT)
Date: Sat, 24 Oct 2026 19:38:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Maxim Mikityanskiy <maxtram95@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard
 controller
Message-ID: <at1n85VJhz9E-bC7@google.com>
References: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com>
 <8cdbdcb893e2353e0ea2fe919e0c8a6a53f8b683.camel@rong.moe>
 <7b21717e80a7b779ab94d964ca40ee68@gmail.com>
 <5bdb870be988333df200ac7d4904dd1bda6ef52f.camel@rong.moe>
 <ab1d30eca12d5e7a764da99b68d0e229@gmail.com>
 <cae0b78ac544dbc78242d55fe370a0eb7926825b.camel@rong.moe>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cae0b78ac544dbc78242d55fe370a0eb7926825b.camel@rong.moe>

On Sun, Oct 25, 2026 at 09:52:27AM +0800, Rong Zhang wrote:
> Hi Dmitry,
> 
> On Sat, 2026-10-24 at 16:13 -0700, Dmitry Torokhov wrote:
> > Hi Rong,
> > 
> > On Sat, Oct 24, 2026 at 11:30:06PM +0800, Rong Zhang wrote:
> > > However, the methodology has been changed from hardware-based to
> > > software-based. Because of the fundamental change, it has the potential
> > > to break something if some users depends on the side-effect of toggling
> > > the aux port.
> > > 
> > > While my device never needs the quirk, I can think of several useful
> > > side-effects:
> > > 
> > > - pause the interrupt (and hence pause event handling) to save some
> > > energy
> > > - prevent the touchpad from waking up the platform
> > > - reset faulty touchpads
> > > 
> > > By switching to the software-based methodology, all these capabilities
> > > have gone. Of course, relying on these side-effects is a misuse, but
> > > relying on the parameter itself without reporting it to the mailing list
> > > is also a misuse! More below.
> > 
> > This reminds me of https://xkcd.com/1172/ ("Workflow").
> > 
> > Also note that I8042_CMD_AUX_DISABLE / I8042_CMD_AUX_ENABLE only toggles
> > the AUX clock inhibit bit in the 8042 controller; it does not power down
> > or reset the touchpad (psmouse is unaware that ideapad-laptop poked the
> > controller behind its back, which is the whole problem), and i8042
> > already manages the AUX port and wakeup state across suspend and resume.
> 
> Thanks for the detailed explanation. I agree that there should be no
> outstanding spacebar-heating workflow depending on I8042_CMD_AUX_DISABLE.
> 
> > 
> > > A completely new behavior reusing an old knob is always prone to break
> > > *something* in a obscure way unless users are notified about the change.
> > > Breaking something with a visible warning [1] in kmsg is much better than
> > > potentially breaking something in radio silence. 
> > > 
> > > We don't want to support poking i8042 anymore, so the use of
> > > 'ctrl_ps2_aux_port' is anyway becoming unsupported. The parameter was
> > > introduced only for debugging and is expected to be removed at any time.
> > > If users don't report their use of the parameter to the mailing list,
> > > they are already relying on a broken setup.
> > > 
> > > By renaming it and breaking the unsupported setup loudly, we encourage
> > > users to report quirky devices, as well as getting rid of an outdated
> > > parameter name.
> > > 
> > > [1]: ideapad_laptop: unknown parameter 'ctrl_ps2_aux_port' ignored
> > 
> > We already have DMI matching for this quirk (ctrl_ps2_aux_port_list[],
> > which has only ever contained the 2011 IdeaPad Z570 since commit
> > c69e7d843d2c added it in 2022), and the module parameter simply sets the
> > exact same priv->features.ctrl_ps2_aux_port flag as the DMI table.
> > 
> > Intentionally breaking the module parameter for anyone who might be
> > using it for its intended purpose (making the touchpad toggle hotkey
> > work on an older IdeaPad) 
> > 
> 
> It's the flag's intended purpose, and never the module parameter's.
> 
> The module parameter's intended purpose is only for debugging and bug
> reporting. And its name and description describe the intended behavior.
> 
> Renaming it does not change either of them, while reusing the knob makes
> its name mismatch the intended behavior.
> 
> > just because of hypothetical spacebar-heating
> > workflows does not make sense to me.
> 
> Using the parameter without reporting is also a spacebar-heating
> workflow. That's why the description asks users to report to the pdx86
> mailing list, so that we can add a new entry to the DMI quirk table. It's
> similar to sysfs bind/unbind to a certain extent, which recently gained
> TAINT_FORCED_BIND.
> 
> We shouldn't create a divergence between the intended behavior and the
> parameter's name simply because such a workflow either.

OK, I'll just defer to Ilpo here. If he wants to rename module option I
can do that. I still believe that this gratuitously breaks users that
happen to use this module parameters. While we would like them to report
their systems they are under no obligation to do so.

Thanks.

-- 
Dmitry
