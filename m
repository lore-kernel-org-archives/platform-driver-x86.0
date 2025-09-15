Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293771F5825
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 21:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757972969; cv=none; b=Wnqd2Re6SsRhftTCdDqhWyX57AQckVqk8SkhVBGG8R3iDZHwf8Mliu7h6PxsoeLo9z6QdGlTUEwgwSyhTFfNxtfrONFg3wYsI67oFoUEiqDIIVijIApiZgNJKP/vhOxovNF6eJW8ny1X3XZ+BApIsagP3NHgB8Fn2dOdQHdYAzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757972969; c=relaxed/simple;
	bh=7oN+VU5fLIUZ/OOgLFJEHioYPuXNL2dLEfG0SPBs4RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdQyDawzl0jzKnmPCkH1K2ebEsQf8B1dDCmFBIFHtTHOtTpursI9Fnq8FITRfroyxRjiP+oEusCqYRbJOgyiFg4ZT1VlzDtUBplztyIW7D2KLHFIyqzxS/T/5U1q0/pJl1obaTWYKzu7VbV9cFPUHWCQWbI47Kn51my3n/Ez2sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=E1EYNO1L; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="E1EYNO1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1757972952; x=1758577752; i=w_armin@gmx.de;
	bh=rx06Ex5GQIkCStaOUpBxC7U+wvY0KgL08z3zriA8vH4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=E1EYNO1LJFyDisUyptzQREU63pFZY+WIa/wnNe3eqo+EePIaLxK6RFDL17ea742M
	 kNGTrk3jVh0hYBwaRUqGbQYSUBFvBXqqaC1tMAPWrA1kFPkCPU0a+qDDUuxIqe/7M
	 dfZav+kjJPOqqITnqeY0noDjTOaF+Y/wq9Qm9Z66HbS1aBZ7P0YUGPkQJr2u6Jzzq
	 AagUYNcBvuXg89ojNKDLic+kJeoLLRwcIUu+zMzPBFwhucnXd+4g1ikxm31+cbXMX
	 PBIDoVFKI0O8cg2huYSdJ+gfOyRl/vLiK3TBTQ1DpbZgU/lBQQkDG1UyP86FYEExO
	 BoeY0+NwUdfvcx8lVQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXGr8-1utRVG0tyQ-00XPYv; Mon, 15
 Sep 2025 23:49:12 +0200
Message-ID: <c17b89d4-a9e3-4dcc-82ef-481f2243fbb9@gmx.de>
Date: Mon, 15 Sep 2025 23:49:10 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/wmi: Fix Typo Error in doc
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Alperen Aksu <aksulperen@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
 platform-driver-x86@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250820155904.32685-2-aksulperen@gmail.com>
 <24912814-6891-4223-BCE3-87D1CD6D9A4D@gmail.com>
 <7c827c2c-4f22-265d-34aa-5377a67b7c65@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <7c827c2c-4f22-265d-34aa-5377a67b7c65@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T6L+959cssJoEpJhCXg+vHW1J4Vh5+YbrhhmJ/wKdo8z1A57zEM
 QaCZvaEIwec9o+QtvUeAoBX0Gj8uoZ/cn32boRNJPERqgHni4Q/Lc5/o99MuUEC5XFKffoZ
 1QB1PhKCKpT9EvsaVowD6xGa1yPL318eXn8zZSpAGq9AM/+BJTaREBJZmr07Tt1iBBW2b+w
 wbpdEtvfgNCV3pIA5l5Hw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PeLj+MnwHcc=;2net1xxgn3RnKzvrpAd/ExQNKoj
 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
 mrgcO5itQw

Am 15.09.25 um 12:13 schrieb Ilpo J=C3=A4rvinen:

> On Wed, 20 Aug 2025, Derek J. Clark wrote:
>> On August 20, 2025 8:58:35 AM PDT, Alperen Aksu <aksulperen@gmail.com> =
wrote:
>>> Fix to correct spelling of "Hardware"
>>>
>> Hi Alperen,
>>
>> While we can fix the spelling of these, they are currently as provided =
by Lenovo. The spelling error exists in the WMI interfaces and during deve=
lopment we decided to leave them wrong to match.
> Yes, I'm not keen on accepting patches like this.
>
> These are hardly something user reads as documentation anyway.

I agree with Derek, this part of the documentation contains text extracted=
 from the underlying interface description of the device.
While it is true that most WMI MOF descriptions contain spelling mistakes,=
 correcting them just for the documentation serves no
purpose.

So thank you for you effort, but the spelling fix is misplaced here.

Thanks,
Armin Wolf

>> - Derek
>>
>>> Signed-off-by: Alperen Aksu <aksulperen@gmail.com>
>>> ---
>>> Documentation/wmi/devices/lenovo-wmi-gamezone.rst | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Docum=
entation/wmi/devices/lenovo-wmi-gamezone.rst
>>> index 997263e51a7d..24b027362e93 100644
>>> --- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>>> +++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>>> @@ -126,7 +126,7 @@ data using the `bmfdec <https://github.com/pali/bm=
fdec>`_ utility:
>>>      [WmiMethodId(65), Implemented, Description("Set IGPU Mode")] void=
 SetIGPUModeStatus([in, Description("IGPU Mode")] UINT32 mode, [out, Descr=
iption("return code")] UINT32 Data);
>>>      [WmiMethodId(66), Implemented, Description("Notify DGPU Status")]=
 void NotifyDGPUStatus([in, Description("DGPU status")] UINT32 status, [ou=
t, Description("return code")] UINT32 Data);
>>>      [WmiMethodId(67), Implemented, Description("Is changed Y log")] v=
oid IsChangedYLog([out, Description("Is changed Y Log")] UINT32 Data);
>>> -    [WmiMethodId(68), Implemented, Description("Get DGPU Hardwawre ID=
")] void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Dat=
a);
>>> +    [WmiMethodId(68), Implemented, Description("Get DGPU Hardware ID"=
)] void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Data=
);
>>>    };
>>>
>>>    [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Descriptio=
n("Definition of CPU OC parameter list"), guid("{B7F3CA0A-ACDC-42D2-9217-7=
7C6C628FBD2}")]
>> - Derek
>>
