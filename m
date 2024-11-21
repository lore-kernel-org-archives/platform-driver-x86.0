Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F51A2AE96
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 14:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732199246; cv=none; b=YtBKL9cn8b6B0sbG/5hzfTWPJYlOyx/fd9cs/4ze1i8m4gAc/D302KJJvJliAcMtS9S1w9+xZKDSXVPgahidnfjna+79cQGLKv+7O6unZjb7ZpIaVWlIqqva8kb8/McElyKZXT+3Yj9YFeQ8nkhUl/45LSa+zv6De6jIQQ3/Y44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732199246; c=relaxed/simple;
	bh=UW4/zpZrnYGj5eHqBy53gK2JvNkTR+FfjzrPrp3u/HA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ANRff5pgzTqcw0Pwky2Fbg8mAYLeEC5m3CGlRnTdyRwMvbP7cD5i9j7049Xz3oZKPhOBonyKuet0FlscpyisiMy7ybKu58Zv8EvuLzhj3pt3D/bDqPajgXEVKy2lOEd8NZsA88Cj+F7FN8g1fvJnZYrO6R6g13QTpxmfwxvrfx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Rw4ZYenA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CkDD1DbK; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Rw4ZYenA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CkDD1DbK"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 325E51380391;
	Thu, 21 Nov 2024 09:27:22 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Thu, 21 Nov 2024 09:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1732199242;
	 x=1732285642; bh=i8IhkUd1IPV2D5by5vj9UQKtrv0nySfU03KOVXxCCbs=; b=
	Rw4ZYenAqlcudXnCEjJhoQsYDm6aSEArNmERwANhujQJQBCVeIB+z5VJtWw3uAAM
	O3Om4KDrtazTQCd6dvpvqLAg1AKJJK2awyd43vdVJ8gOIMrLtR/WU4W4mDE1XG/C
	P/ndcM2bDlnlamWlROMT3aF57XiJNnkVePklyXByYtB+4J4+7PtHtVIzSkzerbUx
	MylUt4XkufC6T9ksGx4amubP8hlZ7vUumxrM5hyBh11YFyx6D1ch7j2iQ7N6D6wL
	ZeeJJcr/VQzvyb5cfpBssIKqPGxPuYqyqtmii9gadgDZkurewKSiAFfhP2U2idDm
	sTdwJBkxugnOV6DA43MwcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732199242; x=
	1732285642; bh=i8IhkUd1IPV2D5by5vj9UQKtrv0nySfU03KOVXxCCbs=; b=C
	kDD1DbKqwjGHv2cQtvV2G32HLJPvA0wVAtnCvkQCBXA41iLMAFAjF7XV3js3Rjmw
	i8KFJJCQ62czE6fn/62uVRAhKL/wEktSfjkOcu1f3GqrYk2C0xCsRKyWhxnSojHd
	1pJzgriRT4RXfpm+bZbIsI1PIUp15uPSQms33Y4QZcVDQu2EWbzFTykP8seY5TX9
	BwBOYb7IXgGtaz0PkpsCZ35EmRm7Oa7OcgMgAKTtPOJDviH2Srog9rcZ/PYW5589
	nWQergPoMH8s8ANWSYDPNfmVSkP/eiB4UcSViABTolPHflphXtWVYy7wCo9k8HKi
	hHZb8wuFiiHaRY1B1YcLA==
X-ME-Sender: <xms:SUM_ZwNYJYeckRcvW4pOV2aN5NJaGymQtmFIdQnw0jNFAAMc8BogQg>
    <xme:SUM_Z29HsxyJWeBKEMAQC3VLyStaBYBCl_6Ygeh8_0F55h25tVx7p4rHmvcg1bhN1
    wngjFAiN5F3O3ETgPE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeeigdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnoh
    hvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhephfevkeejueeukeefhfel
    leejheeuudfgteffvdetkeffjeduleffvdejkeefhedvnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohes
    shhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgvlhhlohesrghmugdrtghomhdprhgt
    phhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpd
    hrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:SUM_Z3R8N160Vocol7v5RA0V3_JCx9qM3mRFF3agSkytwhRAvj7Myg>
    <xmx:SUM_Z4uhQ48-H1jO-mm6-yR2T0SkoMP_dfTUfsi69zrzxyj3iehlZQ>
    <xmx:SUM_Z4duVnWCFtoXCVrlEujSHQlWGh5M2T5-KO1DWNa40ylRMhDAsg>
    <xmx:SUM_Z831dBT8hZpMe0mxwt4IsGxrpi3bFauVAYHVqBYOVeTTQC5BGg>
    <xmx:SkM_Z5olGF7JGIgWQU9t6XpXdHwn2XrBvrVzDJ1ZrU8RCoeZkaN3wLmI>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CF9953C0068; Thu, 21 Nov 2024 09:27:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 21 Nov 2024 09:27:01 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <249d2e7d-e859-4344-8bf6-f73641b009b9@app.fastmail.com>
In-Reply-To: <42828c2f-4653-590f-0879-0ecdd00953ed@linux.intel.com>
References: <20241119171739.77028-1-mario.limonciello@amd.com>
 <20241119171739.77028-14-mario.limonciello@amd.com>
 <afff4d12-b611-68f0-07a0-2d22bc57fc06@linux.intel.com>
 <080ad77b-aa87-4541-8aec-bc74a6c2c0a7@app.fastmail.com>
 <42828c2f-4653-590f-0879-0ecdd00953ed@linux.intel.com>
Subject: Re: [PATCH v7 13/22] ACPI: platform_profile: Add profile attribute for class
 interface
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024, at 6:10 AM, Ilpo J=C3=A4rvinen wrote:
> I don't know why you dropped Mario and the list, I reinstanstated thos=
e=20
> two.

Unintentional - sorry. Hit the reply button instead of reply-all and did=
n't notice. Doh.

>
> On Wed, 20 Nov 2024, Mark Pearson wrote:
>> On Wed, Nov 20, 2024, at 9:56 AM, Ilpo J=C3=A4rvinen wrote:
>> > On Tue, 19 Nov 2024, Mario Limonciello wrote:
>> >
>> >> Reading and writing the `profile` sysfs file will use the callback=
s for
>> >> the platform profile handler to read or set the given profile.
>> >>=20
>> >> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> >> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> >> ---
>> >> v7:
>> >>  * Remove extra handler set
>> >>  * Remove err variable
>> >> v6:
>> >>  * Fix return
>> >> v5:
>> >>  * Drop recovery flow
>> >>  * Don't get profile before setting (not needed)
>> >>  * Simplify casting for call to _store_class_profile()
>> >>  * Only notify legacy interface of changes
>> >>  * Adjust mutex use
>> >> ---
>> >>  drivers/acpi/platform_profile.c | 100 +++++++++++++++++++++++++++=
+++++
>> >>  1 file changed, 100 insertions(+)
>> >>=20
>> >> diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platfo=
rm_profile.c
>> >> index 9d6ead043994c..1530e6096cd39 100644
>> >> --- a/drivers/acpi/platform_profile.c
>> >> +++ b/drivers/acpi/platform_profile.c
>
>> >>  static struct attribute *profile_attrs[] =3D {
>> >>  	&dev_attr_name.attr,
>> >>  	&dev_attr_choices.attr,
>> >> +	&dev_attr_profile.attr,
>> >
>> > I started to wonder if "choices" is good name for the other attribu=
te as=20
>> > it is the set of values "profile" accepts? Should they be bound by =
the=20
>> > naming too like "profile_choices" or something along those lines so=
 the
>> > connection between the two is very evident?
>> >
>> Wouldn't it be weird to not have it in sync with the main sysfs entry=20
>> (which I don't think we can change at that point without messing up=20
>> userspace).
>>=20
>> I think it would be more confusing to have different naming as it wou=
ld=20
>> imply they're different things.
>
> Ah, I didn't realize there's a pre-existing convention. Then just=20
> disregard what I suggested.
>
No idea if it's a convention - I just would think it would be confusing =
for users.=20

Thanks
Mark
