Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04727260D;
	Wed,  3 Dec 2025 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764767786; cv=none; b=Wgoz4i9H5LwQxpRG0n1vCyQfuaQ5/5YneX1NH3AkBRtgF1d4fyN74E0OmtLkO7sRAPPY3CmxmSCDmiOuTHBVEy5pNrFHtauAcvS71ivjPnvbel0IvwjxULWNm9/o1eOuLpB+V3O6a1oNN9+zL+4rbfDuhyTwYb3PywyIM0vTtb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764767786; c=relaxed/simple;
	bh=OFKGqHQp3ANAmaR2/d7Eq6z0ugpJbjbArzVmAZkwF5Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=C+WZnY9tGeDVqP7gTP5w4Aw6U8aup+uoB+Oh4lWfn/w5NE5M5Jb+3wZ096py4OEdnCx43C5wtz+2j3JHsq8KUWQeaOj+gAR+g472nf8kgCmS/SRVP4RF7c2BdduwoDz1gL+Nj3sBGHOj5woSIs9/fgu/sCBy+Oh9Vl74EyJA/Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Lmip+Rcm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I5sUzc0l; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Lmip+Rcm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I5sUzc0l"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F3F9E14000CA;
	Wed,  3 Dec 2025 08:16:20 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Wed, 03 Dec 2025 08:16:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1764767780;
	 x=1764854180; bh=IDNC8dhe+VD+TwBW6i5CUZhcxoqQXwLJKW+FSHQ2LKk=; b=
	Lmip+Rcm9QPQhp3sjAYldrMr/wB3gmQwdo2NYBnOiXQaOj/MZXkMjBxHyx2PBYAK
	k3wExTSoBgXLbrEG7S7TfsGU7CTqv+XqSO01lSBGjlhg48TrPXBQGP/PegmiP02C
	/XjQ+9kHkVsS6WjYxR3q+QkwplKgmaWuElU8SZH+39O3n1EhNhEP1iqGbZeUUnPy
	g/mriys9xzQdQb73Pfo+POoJ4EcU0H4el/fJixk0JIrIiSgtJLjyQZ0vzwSYClTe
	Um8FZFclAEqeoI6IQ1p4TIbqwXFKkkWVa/qtPoymARj0Z86+w4992zOvPu2VU8WH
	y9zhZyW2S6UuT1zFpcFSdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764767780; x=
	1764854180; bh=IDNC8dhe+VD+TwBW6i5CUZhcxoqQXwLJKW+FSHQ2LKk=; b=I
	5sUzc0lNFQCZjojNtKnBhtQoxL0TibsXGaif1pWEZ9tpR0wcgc8wJuJcZwmVRbFp
	BBn6byEW7EDnOdoKnuabuGb5hvbliWxidAfzxvUpj27dThD83j/idb7AQnNNvZlM
	b4+1es5Y2Bm+b2pt4OBr4BKpZMEvg7bNqks9HQ4Jl+Bfg/JaB49f+wPmNpqt6yyx
	9Im6nmJAfHDLgSt3wvbHQZC8ap9XcAIFtxp4SqXGxdvuLZZe3igXy1e42raqiOOV
	UwWQwVQyID8vOdHy09mLdqzalprOR6fwUZcOv34baRyI6WPq7/DdEUpPLi0aAKu4
	Ey8oCOMs8SnQ1n7e9DAXg==
X-ME-Sender: <xms:JDgwaUvt0qBUjL7NhXJGeh44uocR-epsYbhntcDz3ab6_R_BoQhfHw>
    <xme:JDgwacQ-s6GdJQMvMi2R8Bx22yfpAnPsxbwOipK0KYW0sKzkvxp6J88PTVdRr7cZ3
    gzHMMzty2jbY6rqRVl2S4iodp2hGaFTHq9hnJMPgKpao90P4sWzFEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhkucfr
    vggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrqe
    enucggtffrrghtthgvrhhnpeeiudfhkeefieeukeehgeeihfdtvedvveetvdegueetfffg
    geehtdegvefhfeekjeenucffohhmrghinhepshhfrdhnvghtnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhv
    ohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepnhhithhjohhshhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    hhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhjohhshhhiudeslhgvnh
    hovhhordgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidr
    ihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdig
    keeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:JDgwaWT1ZsnzRjcAExrmG0LfXtgwTwIeiRptyxgjTbapM5gnkT5FWw>
    <xmx:JDgwaeBXTDBP3VFsXWiSkShVoJ10Saa_UGeajVSbE-OzmDYxs2vtVQ>
    <xmx:JDgwaWGGOFUl4WfK27BFUIkywl8CAclfVHfqRLqdORQffdfBHgrx1A>
    <xmx:JDgwaYDL55_WvncO21KDKKVijUuQzAExQFaZHzmA_Z15jqk97ZR-QA>
    <xmx:JDgwaYsCWK7eBR9gd2v1zp4ND1bG2ebuwqQk9-agP5no01a-lYD0MnRq>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B8B212CE0072; Wed,  3 Dec 2025 08:16:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AvRhYq4ewj8k
Date: Wed, 03 Dec 2025 08:16:00 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Nitin Joshi" <nitjoshi@gmail.com>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "Nitin Joshi1" <njoshi1@lenovo.com>
Message-Id: <e259642d-e9f3-4d17-a9a5-68eb2fb34948@app.fastmail.com>
In-Reply-To: <5f295577-ab67-4164-a718-f6fbc8911e67@gmail.com>
References: <20251203034032.6018-1-nitjoshi@gmail.com>
 <c8e4a0d2-0641-4e4b-b62a-9c92ec43b3cf@kernel.org>
 <5f295577-ab67-4164-a718-f6fbc8911e67@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add support to detect hardware damage
 detection capability.
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025, at 5:18 AM, Nitin wrote:
> Hi Hans,
>
> Thank you for reviewing this patch.
>
> On 12/3/25 16:52, Hans de Goede wrote:
>> Hi,
>>
>> Interesting new feature. A few small remarks on the proposed
>> sysfs API below.
>>
>> On 3-Dec-25 4:40 AM, Nitin Joshi wrote:
>>> Thinkpads are adding the ability to detect and report hardware damage
>>> status. Add new sysfs interface to identify the impacted component
>>> with status.
>>> Initial support is available for the USB-C replaceable connector.
>>>
>>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
>>> ---
>>>   .../admin-guide/laptops/thinkpad-acpi.rst     |  26 +++
>>>   drivers/platform/x86/lenovo/thinkpad_acpi.c   | 179 ++++++++++++++=
++++
>>>   2 files changed, 205 insertions(+)
>>>
>>> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/D=
ocumentation/admin-guide/laptops/thinkpad-acpi.rst
>>> index 4ab0fef7d440..4a3220529489 100644
>>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>> @@ -54,6 +54,7 @@ detailed description):
>>>   	- Setting keyboard language
>>>   	- WWAN Antenna type
>>>   	- Auxmac
>>> +	- Hardware damage detection capability
>>>  =20
>>>   A compatibility table by model and feature is maintained on the web
>>>   site, http://ibm-acpi.sf.net/. I appreciate any success or failure
>>> @@ -1576,6 +1577,31 @@ percentage level, above which charging will s=
top.
>>>   The exact semantics of the attributes may be found in
>>>   Documentation/ABI/testing/sysfs-class-power.
>>>  =20
>>> +Hardware damage detection capability
>>> +-----------------
>>> +
>>> +sysfs attributes: hwdd_status
>>> +
>>> +Thinkpads are adding the ability to detect and report hardware dama=
ge.
>>> +Add new sysfs interface to identify the impacted component.
>>> +Initial support is available for the USB-C replaceable connector.
>>> +
>>> +The available commands are::
>>> +
>>> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_status
>>> +
>>> +This value displays device type and location of device with damage =
status.
>>> +For example:
>>> +if no damage is detected:
>>> +  No damage detected
>>> +if damage detected:
>>> +  Damage detected:
>>> +  Device: TYPE-C
>>> +  Location: Base, Right side, Center port
>>> +
>>> +The property is read-only. If feature is not supported then sysfs
>>> +class is not created.
>> Nitpick: s/class/attribute/ classes are standardized sysfs
>> interfaces living under /sys/class/ which this is not.
> Ack, I will modify it.
>>
>> Besides the nitpick I'm wondering if we do not want to make
>> this a little bit more friendly / easy for software to parse ?
>>
>> ATM this seems focused on a human directly reading
>> the output but what if we want some sort of automation,
>> like e.g. a Linux version of the Lenovo Vantage sw parsing
>> this in the future?
>>
>> Note I've no specific suggestions for how to make this
>> easier to parse, this is just an observation.
>
> Thank you for pointing this out.=C2=A0 I am open for suggestions and w=
ill=20
> re-check regarding its use case in lenovo vantage in future.
>
I'd not considered it from this perspective.

One concern is that it could be multiple devices in multiple location - =
so breaking it up into too many pieces becomes difficult.

What if we did:
  hwdd_status - 1 or 0 if damage detected
  hwdd_detail - list of damaged items with their location (could be mult=
iple). e.g.
    TYPE-C: Base, Right side, Center port
If hwdd_status is 0 then hwdd_detail would display "No damage detected"

Mark
