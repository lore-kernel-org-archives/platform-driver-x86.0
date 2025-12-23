Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9846B35581E;
	Tue, 23 Dec 2025 20:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521461; cv=none; b=E6fMHkLL8Qv9/iZ2giPZOVkUFO0YD8zN6OKNHOSXP+ITfkU77AGCbyhALgMjbsGBVUn3lZ4dDLn7VHRHmRLZ/FB6mSFxUPSwaggPEgF8GExaBCyYJAKVC9Z2Cnb/hMucTd7Kr1esVxNS0xoLyW2z8G5zoZHlz5mS4ZHgp8sEBWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521461; c=relaxed/simple;
	bh=mD8XmHwPUR0k9hUnd42EAuQ222tMrKi7bpwr2iADqRk=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RFvVimKevcWTdoYZ2tWzSh95AxjiqNefRG48kVOwseKw7fhUXielTnAd1C+EoMIb54VXzfFDi6tAIsLcIF3Ewg6IDsMCeS4qwA+EjF+ljqoT5TOanJ/ECkk2gvRGHV4R5Ze6g6xB088mQ9FmfWVIl9rOeJPpJd0sQHrp1V47ppE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=vqD3vOj7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SYqpQPh2; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="vqD3vOj7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SYqpQPh2"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id AA3D6EC0121;
	Tue, 23 Dec 2025 15:24:16 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 23 Dec 2025 15:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1766521456;
	 x=1766607856; bh=TF2/DDfaKJ2Dy4p9+eMSnqfZXLTievir4s3r1VroPCc=; b=
	vqD3vOj7MX+f972nDTpta5gD1Xx8k58/mHDX8LEDt0jSLvZWGpYsXbbRjzXa43lB
	iTRg7w9pjrTNqnaET8fAPQp3jqDx7UDZALP7Da962DAAh/U3Ev6h8zmNcKxEdHHR
	Ij3BbmkxuXuB/KT+ZtwTaH5d9i3hpED09FmbgzQaoAHqxRYKlZdevUMhkq13cyvU
	oD5qIEVqAbAxHJxijYbGcORaMxZUg8tMJ5v67kv78WUUCp8n0d/6TDol6F2SCAn6
	3rj0GIMLXHnlNgxhKELTGX7yJtot1eK546Z37t26Z4+dd3y34Vgo2tD6Dk5lzdUL
	iBpgzO/cXwkhvyA9cZSqyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1766521456; x=1766607856; bh=T
	F2/DDfaKJ2Dy4p9+eMSnqfZXLTievir4s3r1VroPCc=; b=SYqpQPh2K69VrYPVI
	KxONyDWSqEiE7Ji7l8eDnC8loDCYVje2m03LokwsYBTEaKL22etwqdxc7kuE56lS
	+3oPzgmuVhjRX4OvkKjmvUEx39i8agek6nJJUUe2IyXbfore7HOcPyN9fZEEnh/J
	WMQrsWttY/++uEne+EWt+JbAo/9HDl8pbr0FDeDf38oiv5Yhy9C0WcVo+WzT80lW
	oHTYrJMWWvZJyzUpsV0KzVwILWg9foAqEmda+25IQC7jmHzGBFInmN0k3TWTX5Q1
	rhdrgJJ4ieJ7WTZKQx6xbA6gdVixfRU/JK5QU1b0uz5rR0QJ8Uz/XNgs28CNpb1I
	mStUw==
X-ME-Sender: <xms:cPpKackRnIaz26tHPoDJZQQs_xPQwwOitVWAGfk8hbmsMoBibUChZg>
    <xme:cPpKaWr8SBficezL43vY6JFTubZD5-Q5QEeiekcpv39RWRK4408EazHRnaSdf1dxz
    vMD4wP-DZjv-_3_OzTckVozbwZB7F7A6C8U2_8ktVJGbhcc2NF8b64>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitdejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhkucfr
    vggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrqe
    enucggtffrrghtthgvrhhnpeekffeutdevkeejueekgfeljeegteeludeutedufeduheef
    hfehfeelheehffffkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggp
    rhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsvghnjhgrmh
    hinhdrphhhihhlihhpgeelheesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrth
    hfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:cPpKaUKN_myPieb4p0M3sch2Uc3x6ahAEKnxMLuFt6i7lDRjRIR3vw>
    <xmx:cPpKaUTytJp6E05KtXkyE107RveD9-csU_CkDzrzbbBCc-EJTTxi-Q>
    <xmx:cPpKacpINy0lkxkEMmK0A_I6cMLwjvnO8lRHlEIGssqyBXDKGwpxtQ>
    <xmx:cPpKaZo6VpVTF8pBdj4-45xtupqO-arIHS9mWKcIFl6X6OeKvYqboQ>
    <xmx:cPpKacfmjVvJv17JvWCPAlDIPQ0TA3VcG_PmjSTo-W2EqKzlkZ9XYng4>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 767EA2CE0078; Tue, 23 Dec 2025 15:24:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0BbGRySq_2R
Date: Tue, 23 Dec 2025 15:23:56 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Benjamin Philip" <benjamin.philip495@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <13d990d2-713d-4e1e-a45e-65b92a1e2fc8@app.fastmail.com>
In-Reply-To: 
 <CAMEXYWeGqq3_k55u3poOBtUQY3U6CxO1R3O--vjttap_=NCsNQ@mail.gmail.com>
References: <20251223190844.944633-1-benjamin.philip495@gmail.com>
 <CAMEXYWdAzVQyiPaHnYgRsx70uJMLxD4rYbORg4VqXjq0tq7gMw@mail.gmail.com>
 <CAMEXYWeGqq3_k55u3poOBtUQY3U6CxO1R3O--vjttap_=NCsNQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] platform/x86: think-lmi: Clean up types in headers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Dec 23, 2025, at 2:27 PM, Benjamin Philip wrote:
> Benjamin Philip <benjamin.philip495@gmail.com> writes:
>
>> This commit replaces the uint32_t standard type with preferred u32
>> kernel type, fixing the following checkpatch check:
>>
>> CHECK: Prefer kernel type 'u32' over 'uint32_t'
>>
>> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
>> ---
>>  drivers/platform/x86/lenovo/think-lmi.h | 20 ++++++++++----------
>>  1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/platform/x86/lenovo/think-lmi.h b/drivers/platform/x86/lenovo/think-lmi.h
>> index 017644323d46..6ea4bceafab2 100644
>> --- a/drivers/platform/x86/lenovo/think-lmi.h
>> +++ b/drivers/platform/x86/lenovo/think-lmi.h
>> @@ -58,19 +58,19 @@ struct tlmi_cert_guids {
>>  #define TLMI_PWDCFG_MODE_MULTICERT 3
>>
>>  struct tlmi_pwdcfg_core {
>> -	uint32_t password_mode;
>> -	uint32_t password_state;
>> -	uint32_t min_length;
>> -	uint32_t max_length;
>> -	uint32_t supported_encodings;
>> -	uint32_t supported_keyboard;
>> +	u32 password_mode;
>> +	u32 password_state;
>> +	u32 min_length;
>> +	u32 max_length;
>> +	u32 supported_encodings;
>> +	u32 supported_keyboard;
>>  };
>>
>>  struct tlmi_pwdcfg_ext {
>> -	uint32_t hdd_user_password;
>> -	uint32_t hdd_master_password;
>> -	uint32_t nvme_user_password;
>> -	uint32_t nvme_master_password;
>> +	u32 hdd_user_password;
>> +	u32 hdd_master_password;
>> +	u32 nvme_user_password;
>> +	u32 nvme_master_password;
>>  };
>>
>>  struct tlmi_pwdcfg {
>> --
>> 2.52.0
>
> I've seemed to have botched the In-Reply-To header for this email
> somehow. Please ignore. Sorry!
>
> -- bp

Looks fine
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
