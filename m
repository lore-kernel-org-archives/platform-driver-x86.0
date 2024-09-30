Received: from fallback3.i.mail.ru (fallback3.i.mail.ru [79.137.243.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28388188A05
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Sep 2024 22:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727735897; cv=none; b=B0M4Fbmui7jGnPbZ8rcbvt3PkbTrI++N2/TkJ0A9ysXnCeW9QdqNqzvschcqxMXd67CU65P6DwNg9bTZ16PoiM224cZMguR0gcGtMoSlnBnoBGsLsK8nIPI2vwaWHnpj9gyIBLbmXTAdCAfMXjsh+nXPUBY0ItVECto1T0uBP+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727735897; c=relaxed/simple;
	bh=9LgX9/wpmskCVleCFzSzue/ytulmhztQiF+DS/OG2IQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=TgtGEj9QdE5QMFMX6AADU8GPC1vh7Ixiqb286HIx6aBPaT+jF7ORtREd4T7JewTrb5CpCc/+IJ78SHEsvfVEn6CLBGGlQRtP/Pr/0i/jqq4nY4EZwTrqEF8hZ7weBgouWO7s0H1k+fNTZ57zaCMrswsICuHACzSmUT5T6F1U96o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru; spf=pass smtp.mailfrom=inbox.ru; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=AUH1oWtS; dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b=VtZPuZu5; arc=none smtp.client-ip=79.137.243.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="AUH1oWtS";
	dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru header.b="VtZPuZu5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=vu3s92BPZUbnQ0qBpQSPPvCMr4ynV9ULtO6eGZqnXH0=;
	t=1727735892;x=1727825892; 
	b=AUH1oWtSWh5TKUatjNSQyDuhy4GOOpVw2wHz3ZpOgjQxL7qlccu2i7Nkj0EXITfDOICTGHynu0qmOEKm7VBEAUpWG+NdwbjugsW/2qP360GGxs3q+8+nrW+teagzcO+9IqHuAjDi9vlQhlOuT13GVt4L3iXto9x0OszTrxPlYrd9K/OXVAlXG444cr3NN17HSbAVzepkISIWlm8MnbCZsjgDPArIpg13MPx8pHHjQcwXEQP8sbyN9mx/ycCqgky0F+pyBIaXWnG9pcWoSE82g4DNPHCyJ5U2YmsKEBJMA6tuuX9hrzrS9feRIgdVJcmWA0e0ZafwFOKdL3nxQBydwA==;
Received: from [10.12.4.16] (port=55280 helo=smtp47.i.mail.ru)
	by fallback3.i.mail.ru with esmtp (envelope-from <al.safonov@inbox.ru>)
	id 1svP1s-00HGxZ-PF; Tue, 01 Oct 2024 01:38:09 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:
	MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=vu3s92BPZUbnQ0qBpQSPPvCMr4ynV9ULtO6eGZqnXH0=; t=1727735888; x=1727825888; 
	b=VtZPuZu57mCLYjR+b4tmwfSBItsYjWh3hrjjxJ4FFLhmvNiP+W9YLAdRnILlhrtGAaJyni/6b60
	FC/atcZGg4LroCme4HInXEjfVs9wBOM5ZikjSfM5okxGjMcoRO77XOfKHpYoOSH6UnP47P3xAcjOT
	LCzt2G6h0wStM+vfR9vjAgI2cdcoKUHXS6VCJNcY+2Er4pq8oX5bJ7tlOgmjjPOpwqKxrKk7KtRSa
	B+7l+hGxqHdde+Ng84PORiwI923eDJrTj5ppjLiJCE2LD3oJ1DXxMHwAt7173XWvwOV3sIG/CTpxl
	UZIc9g5Z+TKIGsy0nrHYx0UjDAWjuADWqYCw==;
Received: by exim-smtp-69fb954d46-qfstr with esmtpa (envelope-from <al.safonov@inbox.ru>)
	id 1svP1h-00000000Qef-2cSI; Tue, 01 Oct 2024 01:37:58 +0300
Message-ID: <d1a92068-2498-4892-8294-532222b4d94d@inbox.ru>
Date: Tue, 1 Oct 2024 01:37:55 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Armin Wolf <W_Armin@gmx.de>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>
From: Alexander <al.safonov@inbox.ru>
Subject: acer-wmi: Improving WMI support for Predator/Nitro laptops
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD964E86F54238FCC39AA6C60D9513E93B79E06A36CF7F4ECE1182A05F538085040C83DCDFBFECE12D03DE06ABAFEAF6705D46EB6C75E5408D5AE167531A80231C71A6BF63084DF4D1D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D9C4478D0B876341EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063757004B04402545C58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D839C0E3C9D6863CC16F704ECA5E70A30545D57FAF78F41C5820879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0D9442B0B5983000E8941B15DA834481FA18204E546F3947C2FFDA4F57982C5F4F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006375FFD5C25497261569FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE752BFC73057FA81B4D32BA5DBAC0009BE395957E7521B51C2330BD67F2E7D9AF1090A508E0FED6299176DF2183F8FC7C09C0DA0AD91AF617ECD04E86FAF290E2DB606B96278B59C421DD303D21008E29813377AFFFEAFD269176DF2183F8FC7C088D2E8BEBF93D4B068655334FD4449CB33AC447995A7AD18262FEC7FBD7D1F5BD5E8D9A59859A8B621848445AA7AC3B6089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-B7AD71C0: 6FEFE4C63DFE2D85D8E3AB397C3A1DE8C38BD1B36AAEEBC188FDC00E93F51769EE6B45E9AA4A162370AA53F69E02D5C1
X-C1DE0DAB: 0D63561A33F958A52D7376EB81D863EA5002B1117B3ED6960DBC80AB8A039EE0A13BD6A4B0E00B96277AA237ED671D4372AF3B35EA4094CC5FF72824B19451C69C5DF10A05D560A9D2B5782620B851B7C8C84E951CD0BE2F58C12E6D310A6D53EC1C9C6CFAD2A0F5A71A35648BE338CEED902CAAD3CD6B00BA7CCD254A1CF5E87DC1C2754155B941638A446BE3E5C627BF0CFE790FC11A7261332C5CB50AE517BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC71106E36FF2641B7B842A1950755802D361004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D342B94C1DAF75C4D229F1DACF382A0045F295E4A71D32DA1DE63802DC83A63089C32ACCDF07E6E47A91D7E09C32AA3244C987D0E5FC52A500377DD89D51EBB77420B32465E091921CCEA455F16B58544A2D06CB91D864A7BD2E57A8CE2CFE77B91AB5EBD88EB3327CC94DF6AD25FB923F737E69C174A41D00C
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXgpphPy/32LgGk8/JzzVoba
X-Mailru-Sender: 8D8322B237BDCDFFD1A3F1940C98146156ABC0240F9B79A33DE06ABAFEAF6705D46EB6C75E5408D5130BB289A1C4FBB98AC0361A536CCCDD5A92E71CC7C3152DD1EF35668375B120295E34F9751C493A83151E681B00950BC77752E0C033A69E3453F38A29522196
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4CB1E8E83197BFF8403B72B0E72D04C3ACC5988ADBA52A8B868F3CF0E9FE49B69909415ED8F6C6B308460922C647BEA1031FC1266975EB3E92E566C0F65AF2CE0
X-7FA49CB5: 0D63561A33F958A59890B1D9B777FAF12182A352150AA87930BB6956CEA989C4CACD7DF95DA8FC8BD5E8D9A59859A8B6F2625F01C5EFA1CFA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE71A3E716056DA25A09FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3F05715F7EA08D991117882F4460429728AD0CFFFB425014E868A13BD56FB6657AAAE862A0553A3920E30A4C9C8E338DA54B284D3F3FEA79543847C11F186F3C59DAA53EE0834AAEE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojNqGc3Zc5qMln3Bfq0kItYA==
X-Mailru-MI: 8000000000601000
X-Mras: Ok

Hi,

I've recently been trying to add support for gaming features to my Nitro 
AN17-41 laptop.
in particular, I was interested in the "mode/turbo" button, which changes
the CPU/GPU overclocking and fan control from the HW.

Looking through the ACPI tables and WMI methods, I realized that this 
support
was already provided for Predator series in the `acer-wmi` driver.
But it currently ignores AC adapter plug/unplug events.

I have found relevant WMI events that are currently ignored:

[352418.426647] acer-wmi: Unknown function number - 8 - 0
[352418.426647] acer-wmi: Unknown function number - 9 - 0

After fiddling a bit more, I now know how to trigger these events and what
their values mean:

* Event 8: triggered every time when AC adapter is plugged in or unplugged.
It also triggered when charging via a USB PD adapter.
Values:
     0 - not charging
     1 - standard AC charging
     4 - charging via USB-PD

* Event 9: triggered when HW detects that it is being powered via a 
reliable adapter.
It also somehow coordinates with the result of the WMI method
`GetGamingSysInfo(ACER_WMID_CMD_GET_PREDATOR_V4_BAT_STATUS)`.
In most cases this event fires at the same time as the previous event,
but in some cases (USB-PD charging, or AC charging when the battery is low)
this event fires later, when the battery is charged to a certain level and
the AC adapter is connected. I assume this event means "allow turbo mode".
Values:
     0 - turbo mode is not allowed
     1 - turbo mode is allowed.

This can be used to automatically switch to the appropriate mode.
I can work on this and submit a patch, but I struggling to find what has 
to be done here.

Questions:

1. Is it allowed to change supported platform profile modes at runtime?
Suppose I set or clear bits in the `platform_profile_handler.choices`
when these events fire, so that userspace can know what modes are
currently available.
Is it allowed, and if so, do I need to use additional locking mechanisms?

2. Do I even need to export this specific HW state 
("reliable-AC-adapter-and-good-battery")
via sysfs?

