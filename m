Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734921F8671;
	Fri, 27 Dec 2024 17:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735320126; cv=none; b=ZKKLi9202yUN1PcIXhaZIKmfjg+NeTEhs03DeaHY0MWHhFz/LMVb4Ces74eiHnReAAp6N7QL100Fp6KbEieAjkq12ZKi7yyG1QiF1emKYyqHDH4Z9Bv4bmPI4sbzml3p2fcDqDxO+eWKzychN9c/mJCK9N1aRtXkcR5heKm6VFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735320126; c=relaxed/simple;
	bh=BYqNd3+QQ8CTSB1c1PznxVH3PCIU5bmCFUnza3P9T3U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=vCBPaTShbQrDtRdMn+PSd8tFSHt8apQzLkhGInRrnFaw7knPRTnGlW808OJ/uvjpUwOR/pDpMlfies9Vf87Q1iXvJog/sfZU3jKVlII+NM5wazW2b8yZ+WvNeJ92T29mSrtmNTaY8NjSB53+cum5w7xIfM2CwSbxNpD3wm3Jtg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=SF+9m0/B; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vJIU6HPa; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="SF+9m0/B";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vJIU6HPa"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 631E81380146;
	Fri, 27 Dec 2024 12:22:02 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Fri, 27 Dec 2024 12:22:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1735320122;
	 x=1735406522; bh=Gv8R7IyrFTI6zq0dOg7+GXcUNHY0zBZaoRjhs0vT5jc=; b=
	SF+9m0/Bn32v1Mrx+nm0xjrOCbiRTrBBJ38f9Wfwa31t1VprQNPgHOLiCT9FOmDu
	UwQNpb3F4VIJC4R3To/ueacPXVz9S7fW1rwhCsIpgWpYdVq3G6jWtjMzX8z/uaYi
	dkvofF+/uiMy0bfD0CD3vWhpwuUg0ipmihgytQ9PAHjRIMIjvD4s6YoHJ9YG7imI
	LtQs/c78w8y5IsNWMrrwjGvvqNxvZ4vm8T+MV05akcbfdEQMpgIL8V98ryy569KP
	DBbO5HrgLJ3SM0d4psbqjQH9WCcXt7AKMQGtjS2CobBxznZuteRLHS/tByrQnztE
	pagSNeY0/boA7L+cDjTe2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1735320122; x=
	1735406522; bh=Gv8R7IyrFTI6zq0dOg7+GXcUNHY0zBZaoRjhs0vT5jc=; b=v
	JIU6HPadE+Jk8KI83hkQZeQ6ZsoUzp0FoPhaLHsEShUDaT4M1N2OtC/H5ikyMEcD
	kc6t/y1W9Aavl6WDPVSO+/EcSgtvrBKaGHiWysBHkuWviFP1+Om9FS1U0Jo0nKoq
	coSyQWxplDH4VGK7GycaWhEn+tuFGeUcQ1bCs8JKoTGtA4b6RrsER8qpiljJ5mHv
	xoDEgILWtfxTrOygJ3EWIZNu/Slommqynje1+zkV00cqyQ9P74wmtnQ8Zqgp7WPC
	uFdPWe6+QCzIJ2bNqgkfLpCaIy0+cBdvHtsMg2TlGSngJ2NSgdDHIIjbUMpcLN/3
	def/eZPqClILCefoO3Fcw==
X-ME-Sender: <xms:OeJuZ1CL7MUKETU35HjMV9KxCjJjiFfx6ilvC_zITi-vgJdVw0WjaQ>
    <xme:OeJuZzhNl-DgMt9hE55JR4ATaUcg3cOZPAIWTsOuLz6TTi6SDzZw0VS4HM9porWCs
    8Ca3UO3XjjQCCM08n8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddvtddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvg
    hnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnheptdffvefgtefhveet
    uddvfeelveektdduvdelgfehgfeikeffjeetjeevffektdfhnecuffhomhgrihhnpehkvg
    hrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprh
    gtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepihhkvgdrphgr
    nhestggrnhhonhhitggrlhdrtghomhdprhgtphhtthhopegtohguhihithesghhmrghilh
    drtghomhdprhgtphhtthhopeguvghrvghkjhhohhhnrdgtlhgrrhhksehgmhgrihhlrdgt
    ohhmpdhrtghpthhtohepfigprghrmhhinhesghhmgidruggvpdhrtghpthhtohepnhhijh
    hsudeslhgvnhhovhhordgtohhmpdhrtghpthhtohepshhhrghohhiiudeslhgvnhhovhho
    rdgtohhmpdhrtghpthhtohepiihhrghnghiigiefieeslhgvnhhovhhordgtohhmpdhrtg
    hpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdp
    rhgtphhtthhopehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:OeJuZwmJzEbFLmDih3_m3N-YzDVDFFf_nz08C7PU_BG72EDW_7obJA>
    <xmx:OeJuZ_zaY08yiUBYjjbyp6icn4NsA8_pWe7TkSvcustuPDcVHpqlAA>
    <xmx:OeJuZ6Rp1ijEhKIJPF4jb1Q7xh67dhssckVbmiJVd2Yn4pto30VbYg>
    <xmx:OeJuZybvSiIr8wBryqAWvywFIDjOfJ7eAj7OF6sdVWC4kweTBL4fbA>
    <xmx:OuJuZ2rtnbEkz6pS-DK-kpNVHJ4zX-_fA2ha4NjC_dHOX6veWtZQaC5e>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C7E1B3C0066; Fri, 27 Dec 2024 12:22:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 12:21:39 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Armin Wolf" <W_Armin@gmx.de>, "Cody T.-H. Chiu" <codyit@gmail.com>,
 "Hans de Goede" <hdegoede@redhat.com>, ike.pan@canonical.com
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Luke D . Jones" <luke@ljones.dev>,
 "Xino Ni" <nijs1@lenovo.com>, "Zhixin Zhang" <zhangzx36@lenovo.com>,
 "Mia Shao" <shaohz1@lenovo.com>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <3cebf5c3-32f8-4394-ac35-4706797699e9@app.fastmail.com>
In-Reply-To: <1A14B7E7-4AF9-49A7-ABC9-BEDDC57C4DD4@gmail.com>
References: <20241217230645.15027-1-derekjohn.clark@gmail.com>
 <20241217230645.15027-2-derekjohn.clark@gmail.com>
 <7b1d0298-4cdd-4af7-83e6-9e6287387477@gmail.com>
 <99246696-4854-4EEB-B782-FD8C13D9D723@gmail.com>
 <a4b3f2ca-0c91-4079-bc69-d0a98000ce23@gmx.de>
 <1A14B7E7-4AF9-49A7-ABC9-BEDDC57C4DD4@gmail.com>
Subject: Re: [PATCH 1/1] platform/x86: Add lenovo-legion-wmi drivers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Thu, Dec 26, 2024, at 2:17 AM, Derek J. Clark wrote:
> On December 25, 2024 1:11:32 PM PST, Armin Wolf <W_Armin@gmx.de> wrote:
>>Am 25.12.24 um 09:34 schrieb Derek J. Clark:
>>
>>> 
>>> On December 24, 2024 9:25:19 PM PST, "Cody T.-H. Chiu" <codyit@gmail.com> wrote:
>>>> On 12/17/2024 17:06, Derek J. Clark wrote:
>>>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>>>> ...
>>>>> +config LEGION_OTHER_WMI
>>>>> +	tristate "Lenovo Legion Other Method WMI Driver"
>>>>> +	depends on LEGION_GAMEZONE_WMI
>>>>> +	depends on LEGION_DATA_01_WMI
>>>>> +	select FW_ATTR_CLASS
>>>>> +	help
>>>>> +	  Say Y here if you have a WMI aware Lenovo Legion device and would
>>>> like to use the
>>>>> +	  firmware_attributes API to control various tunable settings
>>>> typically exposed by
>>>>> +	  Lenovo software in Windows.
>>>>> +
>>>>> +	  To compile this driver as a module, choose M here: the module will
>>>>> +	  be called lenovo_legion_wmi_other.
>>>>> +
>>>>>    config IDEAPAD_LAPTOP
>>>>>    	tristate "Lenovo IdeaPad Laptop Extras"
>>>>>    	depends on ACPI
>>>> Hi Derek,
>>>> 
>>>> Thank you for the initiative, love to see we'll finally get a driver developed with the help of official specs.
>>>> 
>>>> Perhaps it's common knowledge to the crowd here but I'd like to call out right now significant portion of the support on Legion ACPI / WMI came from ideapad-laptop which explicitly detects it:
>>>> 
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/ideapad-laptop.c?h=v6.13-rc4#n2108
>>> 
>>> Hi Cody,
>>> 
>>> Doing a quick search of that GUID on the Lenovo Legion WMI spec there are no matches. Perhaps someone at Lenovo can shed some light here, but the IdeaPad driver grabbing that GUID shouldn't interfere with the GUID's we're working on here.
>>> 
>>>> Per my observation majority of users have no idea this is the case because of the misnomer, adding another set of drivers with Legion in the name explicitly, that don't support those features would double the dissonance.
>>> It appears the feature sets are quite different. This seems to enable use of special function/media keys on some (one?) Legion laptops, and it also tries to register an ACPI based platform profile. While the driver does load on my legion go, only the amd_pmf and lenovo-legion-wmi-gamezone drivers have platform profiles registered under the new class at /sys/class/platform-profile/ so that isn't a conflict. I think that the ACPI method may only work on the yoga laptops that are supported by this driver? Again, maybe one of the Lenovo reps can comment on that, but it appears to predate the Custom and Other mode WMI GUID's.
>>
>>Maybe we can remove the "legion" part from the driver name since this WMI device seems to be used on other machines too. Maybe you can instead use "lenovo" when naming the drivers?
>>
>>Thanks,
>>Armin Wolf
>
> I think you have it backwards. Per the spec only legion laptops will 
> use the GUID's for gamezone, custom/other method, lighting, or 
> capability data. Removing legion from the driver name would probably 
> cause more confusion. The GUID in the IdeaPad driver is what seems out 
> of place. I took a closer look at it and the functionality provided by 
> the GUID he mentioned is a notify for when Fn keys are pressed and none 
> of the other GUIDs have that flag implemented. There is a comment about 
> it being for a legion 5 laptop but it may be the case that some IdeaPad 
> laptops use it as well, I'll ask some of the Lenovo folks directly and 
> see if I can get a positive answer if it is a generic Lenovo interface. 
> IMO if we want to reduce confusion it might make more sense to move 
> that GUID into its own driver at a later date, naming it 
> lenovo-wmi-something without a specific product line, or if it's only 
> used on legion laptops then calling it lenovo-legion-wmi-something 
> might be preferred. Alternatively renaming the IdeaPad driver 
> lenovo-laptop could work to disambiguate it. TBS i don't think it's a 
> high priority right now. I'm going to focus on the gamezone and other 
> method drivers for now.
>

It's quite rare to get a spec that is common across all business units sadly (or at least that is my experience). 
I also think it is Legion specific, but we'll have to confirm with that team.
Suggestion: call it lenovo-gamezone-wmi?

Side note - I wouldn't rename ideapad as lenovo-laptop. There are way too many other laptops (thinkpad etc) that don't use that driver (and there is no official Lenovo involvement with that driver to my knowledge).

Mark


