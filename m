Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25434145B25
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Apr 2025 19:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743794622; cv=none; b=mh9KZn/AA5o94uCYgDSsjT9NIi6T3n03MYUtx9T6rLNC3khw8m9fr4QDvyblHbn44oTibry39Q5cityWYa2TiYi8JVZP6keIbI/vUU1VwobXuURhx53cTs3eITfOk1IXL2ENTJXbqyhOcqu5Zl2ZnYGNQbZc19Xl+sfuiy6daDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743794622; c=relaxed/simple;
	bh=fnJk2VwFhlehmN7QU9Vz8rItGFjkxbJGdYSNl+d7cKI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kuLWYcCU6YSO2bnYx9znkLrTX6YwZX9iRcFn/LW1VKEayiAXeEa9+CY4YpjHc5bw2yU6BTXRbLHLoUXqpTDA5+raUMufh7DEjjeZdm32UQCR5Xdqmd6S1BIj0scWaUkd6P3AyZCtCjxwn8Nf81jOKUa+l1h6Kk3Q5Jq5U+pyskQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=H/SPwM+l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=icqG44Re; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="H/SPwM+l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="icqG44Re"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 043D11380214;
	Fri,  4 Apr 2025 15:23:38 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-06.internal (MEProxy); Fri, 04 Apr 2025 15:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1743794618;
	 x=1743881018; bh=IHgkaPNaHnijokxBfIx9XLDiVTiot4+ibuW1KBEcUj0=; b=
	H/SPwM+lB6O37KW2slaDmjAvGcq16O4m0kEe05/mLq3NAelbLhl2j7sD+ugNxDEt
	m/OTaDele4yfrv41lolYQtcGry8jt+yL6KDfT53kGNKhX5tKNSLDGYhboFqq1iTA
	R9sziTqrVTZCLOnDz09UKSQwy5vTSgBswIPhs5Q5PPj4NGazOB6IuuuiunaTNaBS
	rVrZCp319HbXxVXXQkvr9oJZVQUbvxMA2El2dC73ZLOyO1hoBl41f4ojb4axCYOl
	GVztmDNFp3LibRY4vr+W5XrHlmWzsY737kwcIibwNy2GNSAw18YyAXDYmFrYsCql
	mZwKMr1ZucEGL7wti86Ynw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743794618; x=
	1743881018; bh=IHgkaPNaHnijokxBfIx9XLDiVTiot4+ibuW1KBEcUj0=; b=i
	cqG44ReXPgkjdrrvZgU3V9fNPLUZQzLvstCicViq9h9Hsdpg/FrIDE16Dm677Rht
	GZ4dW0nzD+Z0NRbcW790RfRDUOYT5YdgmEveViiWWidFDwPBCEv0alNVtTtAGQmF
	OGsGDw6DVVp90c+7Pp9jnYl4d8a0ZOnf/gFKa20XxjgPMFVHXy1ieUp1lLNeav9r
	43lpxtOya5b6PEqid3fVq+OyPzvubmvp75S54EnpmGtUl3go6/+WbkFz5bhSelpD
	0KgSo5baO9q0nRxpD9w20MAkFU9OPhficQ+OQZ6X9OpYqtkMVuucgLtIWdqCOyY0
	LJ5ubHRx0Z3n2Gw2p0jFw==
X-ME-Sender: <xms:uTHwZ3E1aFWCFSQbkf91kyF9Szn_PIZ66KCSSZDzX4B67UvnLZ5oGA>
    <xme:uTHwZ0VjhIdRMDDndGOHa0OUt3oJ8ADpZ2SdXSSFjeFfWQxnqlENBa-G4e-Iyw6Df
    Uose6MlenkmdtQPCtY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduledvvdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlh
    gvnhhovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhveekjeeuueek
    fefhleeljeehuedugfetffdvteekffejudelffdvjeekfeehvdenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhho
    vhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehnihhtjhhoshhhihesghhmrghilhdrtghomhdprhgtphhtthho
    pehnjhhoshhhihdusehlvghnohhvohdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrh
    hvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepihgsmhdqrggt
    phhiqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpth
    htohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehplhgrthhf
    ohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:uTHwZ5KaivU8HXTdNwYEjy6Lyn5k4EWQbHvliISXsMWNRSoFEKW55g>
    <xmx:uTHwZ1FoXnJXuILr9IICCFdoJElxDQO1EMaNGFZYN_cdlEaoIt1W0w>
    <xmx:uTHwZ9X02igNg_qGm2TfACP7pIdJ8DeBfr7PoWa-9kL7dRl7sCarUg>
    <xmx:uTHwZwM5dAgACf8OIe5ZGUQMGNXj0AJGPsnl2CcKBpkgLiNmE41xKA>
    <xmx:ujHwZ2WqSxvDx-8ohFa1xj8bv8bivFqRk1VqVbcUSUvHIyc2asYmwYld>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1BE923C0069; Fri,  4 Apr 2025 15:23:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tb4c09ec3c7670d42
Date: Fri, 04 Apr 2025 15:23:16 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Nitin Joshi" <nitjoshi@gmail.com>, "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, "Nitin Joshi1" <njoshi1@lenovo.com>
Message-Id: <255bb094-ad3a-4711-866f-659b2687c929@app.fastmail.com>
In-Reply-To: <0b0f51ab-667e-4497-8f24-2b9433427d1c@gmail.com>
References: <20250403053127.4777-1-nitjoshi@gmail.com>
 <dbb95bde-8163-4799-8414-c60ba1c69aa5@redhat.com>
 <cf577f4d-ebfe-4b23-b918-2d59d9e81271@gmail.com>
 <f3f53d44-379a-42a4-9638-9e8532a83624@redhat.com>
 <0b0f51ab-667e-4497-8f24-2b9433427d1c@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add support for new hotkey for camera
 shutter switch
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Nitin,

On Fri, Apr 4, 2025, at 5:02 AM, Nitin Joshi wrote:
> Hello Hans,
>
> On 4/4/25 16:25, Hans de Goede wrote:
>> Hi Nitin,
>>=20
>> On 4-Apr-25 8:44 AM, Nitin Joshi wrote:
>>> Hello Hans,
>>>
>>> Thank you for reviewing patch.
>>>
>>> On 4/3/25 19:34, Hans de Goede wrote:
>>>> Hi Nitin,
>>>>
>>>> On 3-Apr-25 7:31 AM, Nitin Joshi wrote:
>>>>> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen =
1'
>>>>> has new shortcut on F9 key i.e to switch camera shutter and it
>>>>> send a new 0x131b hkey event when F9 key is pressed.
>>>>>
>>>>> This commit adds support for new hkey 0x131b.
>>>>> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
>>>>
>>>> Does the EC also actually enable/disable the camera in response to
>>>> this new hotkey, or is this purely a request to userspace / the OS
>>>> to enable/disable the camera
>>> Enable/disable is actually being done by EC. Camera enablement for t=
hese products are still in testing phase.
>>> ?
>>=20
>> Ok, I assume we can also get the state (enabled vs disabled)
>> e.g. from the event? In that case the events should be reported using
>> EV_SW, SW_CAMERA_LENS_COVER and we should also get the initial
>> state and set the switch to the initial state before registering
>> the input device.
> Enable/Disable status will be determine in IPU side which receives=20
> notification from EC. So, the only way to determine the status would b=
e=20
> to determine the status in IPU side.
> So, purpose of this patch will only to avoid "unhandled hkey event"=20
> error from thinkpad_acpi driver.
> Please let me know, if i am missing something.
>

I hadn't thought about this - but we need to be able to track the status=
 to make sure (eventually) that the right status gets displayed in users=
pace. It would be bad if it was out of sync with the IPU.

Is the initial status always going to be disabled, or do we need a mecha=
nism from Intel to probe the current status?

Mark

>>=20
>> Regards,
>>=20
>> Hans
>>=20
> Thanks & Regards,
> Nitin Joshi
>>=20
>>=20
>>=20
>>>>> ---
>>>>>  =C2=A0 drivers/platform/x86/thinkpad_acpi.c | 2 ++
>>>>>  =C2=A0 1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platfo=
rm/x86/thinkpad_acpi.c
>>>>> index 0384cf311878..80f77f9c7a58 100644
>>>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>>>> @@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * directly in the sparse-keymap.
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TP_HKEY_EV_AMT_TOGGLE=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0x131a, /* Toggle AMT on/off */
>>>>> +=C2=A0=C2=A0=C2=A0 TP_HKEY_EV_CAMERASHUTTER_TOGGLE =3D 0x131b, /*=
 Toggle Camera Shutter */
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TP_HKEY_EV_DOUBLETAP_TOGGLE=C2=A0=C2=
=A0=C2=A0 =3D 0x131c, /* Toggle trackpoint doubletap on/off */
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TP_HKEY_EV_PROFILE_TOGGLE=C2=A0=C2=
=A0=C2=A0 =3D 0x131f, /* Toggle platform profile in 2024 systems */
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TP_HKEY_EV_PROFILE_TOGGLE2=C2=A0=C2=
=A0=C2=A0 =3D 0x1401, /* Toggle platform profile in 2025 + systems */
>>>>> @@ -3271,6 +3272,7 @@ static const struct key_entry keymap_lenovo[=
] __initconst =3D {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * after switching to sparse =
keymap support. The mappings above use translated
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * scancodes to preserve uAPI=
 compatibility, see tpacpi_input_send_key().
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> +=C2=A0=C2=A0=C2=A0 { KE_KEY, TP_HKEY_EV_CAMERASHUTTER_TOGGLE, { K=
EY_CAMERA_ACCESS_TOGGLE } },
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY, 0x131d, { KEY_VENDOR } }=
, /* System debug info, similar to old ThinkPad key */
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY, 0x1320, { KEY_LINK_PHONE=
 } },
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_KEY, TP_HKEY_EV_TRACK_DOUBLET=
AP /* 0x8036 */, { KEY_PROG4 } },
>>>>
>>>
>>
