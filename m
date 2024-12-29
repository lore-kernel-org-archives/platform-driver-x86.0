Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E492AD1C;
	Sun, 29 Dec 2024 20:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735504133; cv=none; b=uDruAg56i0g9qqhDxcgC+xzy7FVMk9caT6uS5yJSUfuwhrCIwcNECWu7cI01HGSZtue2yySeGAVRqBCRiMHSlz7sIUq/pRP3ELYfRWmuve+UEgE1iwjGTJ89hfLHBoDB21G7fzxlgX4So0UPUFjTdh02l8lmUmB4S/DDJxsaRss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735504133; c=relaxed/simple;
	bh=W5t8jBu1WR1hwP2WMz0ghkz8BBbCo2xL3/PPjsS1XmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjbO3kSuq1uZxQL1Ss8IZXnugSILnRYzi89s7ZlOVtCxLLaptjVwq4yGKFdaQYqXr62mn/ZZJ/xUIZVJZbJsNerdj5xrCFDetHgYYE97A3iqfEZa4YXqS9Pc7VZxuWRnPaifqMpvEf/8bJPdRYMZH3F5Nr4GV9CEuIU+0pkwNFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Y5tYZkHR; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Y5tYZkHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735504113; x=1736108913; i=w_armin@gmx.de;
	bh=W5t8jBu1WR1hwP2WMz0ghkz8BBbCo2xL3/PPjsS1XmY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Y5tYZkHRMZHF84kWmrHbIeOiNYWxr0n7LZh+rCtoZDDusZo0JMnTrJrq1La0o5nj
	 PkN4NW4QHeJ4TEr7uqdwqjyr6YqaijpmK7Fapf0ts6/3ZkG0hLRnCwk85b52Taxm4
	 pxuyEnm4rjbOOeMxTxgHFJmPMIBEsYcbIiS/RVbpIewjbpKuSkrOd+tXSJhHNum8P
	 OhtsUsSfbpkZoy+yjRFKsoz2ABnioHGO3tDURe32uIlgau7hvqx3YvY8ReFGnjZ12
	 QIMGNVzkROLR8MzLHvxpLI7cVpgts4OolxhzgM+LTTeolNPle1/EjK3gCSCWndnxB
	 8wt0IExlwxyw66j+Ng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N49h5-1taQ1w103l-00w82C; Sun, 29
 Dec 2024 21:28:33 +0100
Message-ID: <0a1dc167-2a2b-42bc-a76f-c0a8036efdee@gmx.de>
Date: Sun, 29 Dec 2024 21:28:29 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] platform/x86: Add Lenovo Legion WMI Drivers
To: Antheas Kapenekakis <lkml@antheas.dev>, derekjohn.clark@gmail.com
Cc: corbet@lwn.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, luke@ljones.dev,
 mpearson-lenovo@squebb.ca, nijs1@lenovo.com, pgriffais@valvesoftware.com,
 platform-driver-x86@vger.kernel.org, shaohz1@lenovo.com, superm1@kernel.org,
 zhangzx36@lenovo.com, johnfanv2@gmail.com, codyit@gmail.com
References: <20241217230645.15027-2-derekjohn.clark@gmail.com>
 <20241227184825.415286-1-lkml@antheas.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241227184825.415286-1-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:8R1e1u3Xn11LPtBSwXfw5Tqy+JVv/ulCIEa7Ujm430MENrNUDHO
 efAsTCT3j3l8swADjkZ1RAnVbPLGkWryDHBKFWsaJP1C0a9WzYx5VSdqX0BaIY7cGAk5CVt
 mspcKXGc9wsl5a8gkAMwz99SfX+N8SLucSIZeSy1kbby2co57MbeLMYQHDqFDbOdi84ToAi
 je3MGloS0xS18rRJgPoRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0BHA9+N0KuQ=;Ii2RDt2SmGbg2+qSs442Z0mlF2/
 Fu4PB+Y6GmIgyapefoXqT3uUvzv2dXog3uhGWrnzTg6mO0FZE/yS8khfs3GDbMEP5WaR36d2A
 IH2+hWh8/esCstNIm/X6s90g5/XFX8kzr16GnrZD5UjND9bdaUsFK+524aF+64ml2FFQ+ICSN
 Fix/bbFlhH3Z6jo44xEA+Kgg+qj9bAVNKfhOm3mgHML0PZz97AJVU3n8pG1QgQl+R2HHRybwM
 ZRxtp0alMt6sGfL0t901/ovfiuWQE0I1xLmfWVmr3la2TQRbOGjYUJZA5QAeKuFsCKAt8jC68
 J5nfbp75h+wzR8SlYwjyMsaI+Wr5tQLw5/TOOEZkV5EbGQ2GAi/3I0RTVFbhNFn65+pOOJtMk
 kj9gZJ4Vbth8qnaiOPt1REwZTASXuu2qzSmGwwSPB7qvHMwZCHQRfQYxwytwVQrNlx/LDL3fw
 YwcLvYskBBnQgWXLkaVAsjnMuTbnjbyObjqRGnH8sIbMeT5NtbdiAbkeOrhLiq045wIIrdN5D
 k2+Ug3F2XIIXBhXtgTrtkhxX53i96x2UkCt5ZHEgiTPNEasbrM70rsJVoswdJKR864GI1hnAx
 ppePLi055ZaWWX6JuG8nkN8t69jgwGsYkE43YAHbsqDstxG5R4fz/Z73GZX1XWwJN2ggAs95O
 z0ONhdaljVJTfzGsgdq0kQrngTycPQXv2q4Mm4Ov9r6oVvS4ynkwdgb25x75A8mM9okrYZMjp
 6Zd7aGqNVB3iEa6qfY9OFNRWiPLCjQZGXj1amxdUdioQi9Nku8CXKDc81pU5mv4uX8Z9hTccA
 LvsDV5c87hXUgCRxzGAmbpzE4xn2QE0/IJBO3OsgG70ea9QNxzW21nOeTwyFzT0NizceA5AqG
 1O+NaUayCyXziVdLS8GjUZzbgafBhm6yDXkJc1Zk3BZ5XUeUdE1ADRSpMibaftn9AnDldk+TB
 OUPW0uLnCbHNdl2aL6ZBkb5KvzTOVglbPc2FDRa++/lFbVbAwzHb09so5u8syzLNqt3lXYh+T
 r3lEOi2fGXpJLryK+BWeUaFPwEztKO2KiVDd1Wq4bD5UuW9S0t1zi5ACO15uSlQ4hRpB1m1C0
 knTZKxHRW52i6f7BhZo8CrQFf99iJL

Am 27.12.24 um 19:48 schrieb Antheas Kapenekakis:

> Hi Derek,
>
> Good job on the driver. I spent a bit of time reviewing it today, and I
> have a few thoughts. Hopefully you can go through them fast, and we can
> have a solid base of understanding moving forward so that I can e.g.,
> merge your driver on Bazzite ahead of the kernel, so you can get some
> valuable testing.
>
> // Firmware Attributes
> Right now, I have one major concern I'd like to be addressed before
> moving into the details of the driver. This is mirrored in the Asus
> driver you referenced [1] as well and I do not think I have seen solid
> argumentation for it yet.
>
> Essentially, you are using the firmware attributes interface for the
> ephemeral attributes SPL, SPPT, and FPPT which is also a concern mirrored
> in the thread with Armin (+cc) and John (+cc) [2]. The question here
> becomes, if exposing fan curve attributes via the firmware interface is
> fickle, why is it correct for SPL, SPPT, and FPPT?
>
> For context, when it comes to Asus (see [1]), these tunables reset during
> reboots, after sleep, and when changing the TDP mode. Specifically, TDP
> mode, SPL, SPPT, and FPPT, and the fan curve are not preserved between
> reboots, with only TDP mode being preserved between sleep. Following,
> setting TDP mode resets SPL, SPP, and FPPT, and setting any one of those
> resets the fan curve.
>
> For Lenovo and the Legion Go (1st Gen) it actually depends on the BIOS
> version. In early BIOSes, the custom tunings used to be preserved until
> you reset the BIOS. However, I suspect that this caused used confusion, as
> if you uninstalled Legion Space, the tunings to custom mode would still be
> applied which would be unintuitive. In new BIOS versions, the tunings reset
> when changing TDP modes, which can be done with the combination Legion
> L + Y. I am unsure if they are still preserved between reboots if you
> remain in custom mode. Fan curve resets as well. But the point is that they
> are not persisted, at least to the extent expected by the firmware
> attributes class and writing to them in other modes is undefined.
>
> Lastly, if another driver were to be developed e.g., for AMD out-of-tree
> to control devices without a vendor interface, we'd have the same
> issue. As this driver or [1] merging would set a precedent for using
> firmware attributes for these tunings, I think it is important to reach
> agreement before moving forward. For AMD w/o vendor, more details can
> be found in [3]. In [3], Mario makes an RFC for an alt interface for SPL,
> SPPT, and FPPT, through amd_pmf which does not have this peculiar issue.
>
> There are settings where it does make sense however, such as VRAM, boot
> sound (Asus), and the suspend light/barrel plug RGB (Legion). These
> settings are typically persisted in BIOS and there is no ambiguity for
> fitness in those.
>
> // Driver Details
> Ok, as for the rest of the driver, I have (i) some stylistic comments and
> (ii) will mirror similar concerns to John in unnecessary accesses.
>
> (i) Stylistic Comments
> I would personally be a fan of adding WMI support to the kernel, such that
> userspace can access WMI attributes without the use of a driver, as it is
> done in Windows. However, as I have discussed with Mario, such a thing is
> not an easy task, as it would require adding a BMOF parser to the kernel
> which is a monumental effort. In any case, the current kernel requires
> us custom write drivers for the WMI interface.

Actually i am currently working on decoding the BMOF format based on the bmfdec utility
developed by Pali.

The issue with exposing those WMI methods to userspace like how it is done under Windows
would create a massive security issue since most WMI methods are security sensitive and
quite fragile when presented with invalid/unusual input data (i fully blame the BIOS developers
here, they simply do not care about this).

That is why we have to stick with WMI drivers.

>
> The reason for this preface is that I think that your driver style is a bit
> "too close" to what such a thing would look. E.g., in the driver I can see
> snippets such as `LENOVO_CAPABILITY_DATA_01 WMI data block driver.` and
> `MODULE_IMPORT_NS("CAPDATA_WMI");`. Since you are going through the effort
> of writing a custom driver, I would be more opinionated in how I'd design
> the driver, so that it's more intuitive from a user's perspective. I think
> John's driver (which has its own issues) and the asus-wmi drivers strike a
> bit better balance, where they "translate" the WMI calls into an ABI that
> can be documented and then parsed by a developer.
>
> Such a design process would then also allow to claim the name legion, as
> you could make sure the legion driver only loads on Legion laptops, where
> now it would randomly load in other laptops as well. Sidenote here is
> that this is something I also found confusing, as the Legion Go does not
> have a keyboard so that driver should definitely not load.
> E.g., you could only load when you detect the Gamezone interface and then
> access the other two as well. The Gamezone interface is only used in
> Legion laptops AFAIK. I think Lenovo also kind of implements all three
> as stubs even if some are not used, to allow extending them with BIOS
> updates, so blindly loading drivers based on the interface might not be
> the best idea in any case. When the Legion Go released, I think only one
> of the three interfaces was used, for example, but all three were present.
> (ii) Unnecessary Accesses
> Even though you went hands off on your design of the driver, at the same
> time you held back when it comes to userspace accesses by globally forcing
> the Other function hints as limits. This creates two issues.
>
> The first one is that those limits might be wrong for certain devices or
> certain users might want to go a bit above them, which would mean that if
> you enforce them you'd need to provide a way to quirk them and a module
> parameter override (I know they are correct for the Legion Go as I have
> looked through them as well). But if it is not necessary in Windows,
> why would we add additional roadblocks in the kernel? If Lenovo feels the
> need to enforce them, they can do so in their firmware and extend that
> protection to Windows as well. Asus does when it comes to their fan curve
> firmware, for example.

IMHO if the firmware provides min and max limits for settings then the kernel should
enforce them. The reason for this is that the firmware might only be tested with the
official Lenovo OEM software and might therefor rely on the userspace software to not
exceed those limits.
If we allow a userspace application to exceed those limits then the firmware could break
and/or behave erratically.

Of course we could add a module param to tell the driver to ignore those limits. But such
a thing is totally optional and can be added later when the need arises.

> The second is that you are making a lot of necessary calls, which may harm
> performance or potentially cause instability. My workflow for setting TDP
> on the Go is that I first respect the TDP mode the user has set using
> Legion L + Y. If the user wants to change that, then I do the following:
> set TDP mode to custom, set the TDP, set the SPL, SPPT, and FPPT, and then
> set the fan curve. I also add a small delay in-between each of these calls
> as a further precaution. In your current driver, each of these calls would
> make two additional calls to the WMI interface (one for the limits and
> one for the TDP mode), which would more than double the number of calls
> made in a typical scenario (from 5 to 12), where each triplet is made
> back to back.
>
> There is also the issue mentioned by John, where you do cross-interface
> interactions etc. To fix this, you'd have to retrieve the limits from
> firmware on probing and then cache them in the driver after quirking. It
> would be much easier just to skip all of this for now and just use them to
> prepopulate _min and _max values as hints instead, which you already do.

Your point has some merit, as WMI calls are indeed quite slow. Caching the values would indeed increase performance.
However i still suggest that the driver actually enforces those limits, as the firmware might rely on this.

Thanks,
Armin Wolf

> Those were my comments. You mentioned that you are travelling and might not
> have access to your PC so take your time with the replies.
>
> Happy holidays,
> Antheas
>
> [1] https://lore.kernel.org/all/20240930000046.51388-1-luke@ljones.dev/
> [2] https://lore.kernel.org/lkml/eb165321-6a52-4464-bb58-11d8f9ff2008@gmx.de/
> [3] https://lore.kernel.org/lkml/20240926025955.1728766-1-superm1@kernel.org/
