Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6874143BDCB
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 18:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362015; cv=none; b=U7gaYA4IczM/LM7Vd0jw1Xr6vJ8HmURAtAImVESpXvAD2WWUf3gLYSqEBQtgmZkBGZpRGD712M17Srz79hRfZojVcujc5r8AJwU1ItSYub3/NVz5gRvkEUPe2tSq2iiN2P5RPEUeIKi/ly2vPiyMi9IgUUtwXpoA0lHVgS3GMZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362015; c=relaxed/simple;
	bh=TbIpZhgUktkR3O+4pQLR+Y88F/GLzqWjXNN+0Niec5I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=n8CZURs0Dx7vLKO3oeCcRIBEycI7iHFTVgO/ogSNmG0MX/himljbTMWchwSMvXPsHkk63tfoAmX8Wac/1UUCPuCJnp0Sxpqeyi6u3be5qFU77ALcxaaO7HQ8tpuroBq6ZynTPLHkXChYOj2UjUPNQoySAi/qRf5VUWZeYyicdE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=cv6ki4Rr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ffn9d6o5; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="cv6ki4Rr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ffn9d6o5"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 954B91D000D1;
	Fri, 25 Sep 2026 14:46:52 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 25 Sep 2026 14:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790362012;
	 x=1790448412; bh=1Z2+6Stm4YfYliJzh/eHpVaSyf8Vd2l9Ak+9lRq2Pq8=; b=
	cv6ki4RrTBDBEqngFq5BCd8GkcEFt6MXi7GX9PM10pSeuBWVIzp96oDOLLc+o5hh
	GQ6ib0Cw6RtWtKD+QrN2SOcWr6VVwnGtpF8BbYDn7kkqDkGunTKgFXlXcDictR4L
	j0BZJocQwKx2Cyf9I+it9463ufuoUnw+su2SONyfKipB1hRLVSjylFvVRjKfwuqU
	IvyyVnkXg2wrY/A3Y9ij5GBJo/1XM2br5cD4UralmsXAZCVOlk2R8HjPadqDSp69
	21eSbSVDqAMkEwKmPB+5pXfS73hta6yETk7ZEmrcBTAHCN7o0WOfgk3Bw1tqQjBy
	SzND3cbSVMxh0er/TGDLHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790362012; x=
	1790448412; bh=1Z2+6Stm4YfYliJzh/eHpVaSyf8Vd2l9Ak+9lRq2Pq8=; b=F
	fn9d6o5adFlvDIdrq/93/QUPGcPpwwTq8+89DREIwJKsbElfGzkbgJ2dOrVi3YOf
	Nj+pFq1kNIKar0tPOf5A7KGL9JR7khFKcRfqaNRbvDsBKXn7JuTjE1jgazgP0lAa
	kTX6DxGYyqvdrUn+CkWxritMGXy4HtLnAosy1FGusybr5L8aEnbxpHuqXzeH/F7f
	+ytrcS3b4Fv7OJ2E8J11baPyLdZwZmxr3pIgUJMZjDH0YCXK6h0gvy64Xsjr6U4u
	oE79Wg+oZ04+t1QWEhZf6ISwgUYQAAtUU8qi/hcJLQtFGJKWlPWY5Vs/aSrjEMNk
	8fin/+l9dkUv9BHK9Xujw==
X-ME-Sender: <xms:m8G2anqrrTmUtI3dfzWjn0gcrjKiUfksQZrIyfsle7QwBeu6BTqgsQ>
    <xme:m8G2asdyCFP6ZW1RbThAowLmNdo9mdP0yq7cLzR0ivDG3oCTswjOorQzlajW5XKBB
    EFWY_brePnQtb8n3vTLg2ORXpoCEVQlsdB0QUxWdG0fndN4TfvaHHY>
X-ME-Proxy-Cause: dmFkZTFS4SqwiaCEpfgxs6Eift8tvcnfmGNi9PApPKElyzEI94g7tfegnqKeJ51mjEfDbJ
    0hfvLvb/T5rOO7o3cZnjDn1ugBiaByr36XbR/RQIaau/inWyP+msxXmZ0pIOdZlYo24Nx3
    X7shd2kFh9eLbw8DhYHvJCGs/y7E0NP+tMm5CiLXq4iLlmv+0AGyMwee6mgZre5RrhHkZu
    ZWDuT54Z/6HndZrth9kRYyQh1OGmuM+JrAZ7JHzfYR4G92f+l4hHs32B2La/Y5/uvbWuax
    PoCm625OHNLW5Jh1CC8pu7QvQraUPHP0FKfdGurPgKRs1HXYNmnyP48cRYZ4ERLRiqxRhd
    O2yJQhKZccWgjdkAXci0cCpYTHGWNn31ZI2HgRbjjDXZzws/Nh2aiC3ht0D0p8unj9sJBx
    StiHGBR8QO7YAmJAu5stJrnAwSxvJOhp0Hd0NoeOOCNc0Z4VjJH14qkA9C59tq2mX6kkKj
    1UkDPxtBh0o7+ZNysJ8UsgjIENa+yO7t64cTxZKzHRtmh4JoixpelaVf9KFs8mAwY/BFbx
    x/vcq0MLzsJYIv3quQyCI4WtHKE0pAwJQaa8r+f7GOAeXD9NnxujZsAyKjXby3OGFLffkw
    6lBuIqN2+8JdBx9IdpfcILTyvaUpIJ9AEDmKhB6ntlPxoEIGgue8pUkS9mvw
X-ME-Proxy: <xmx:m8G2alTFQzcbkPwGvflFrdU5XN5NIhuS6v3HD1VVKO0eTQ4tPTFylA>
    <xmx:nMG2ao3c4X62JJ9JN4K6hVbOgoESgoBDOlsg04hvNmWNIMf5twPdrA>
    <xmx:nMG2aqvxJ_6HJLY_0fcy8mXZbZk521dzU8WYVxv8hyGynOiVxuS_TA>
    <xmx:nMG2auiCLrz1VSH6qgglBcgBKb0pI3ttdas4kBjUqKPg5zXN6r_ZFA>
    <xmx:nMG2auOFzFt-rpfgGdAQpE_uaoYMwyBM3ZS4je3yEYqoPTd9wFXKeYGZ>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 990212C0006C; Fri, 25 Sep 2026 14:46:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AhK4IBiDdJJ-
Date: Fri, 25 Sep 2026 14:46:31 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: "Prasanth Ksr" <prasanth.ksr@dell.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, Dell.Client.Kernel@dell.com,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <69bf2d5e-be66-4259-b9ca-903a703fe3cb@app.fastmail.com>
In-Reply-To: <9ea1a4fe-5ce9-46f6-8347-85c951ad1060@gmx.de>
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-4-mpearson-lenovo@squebb.ca>
 <9ea1a4fe-5ce9-46f6-8347-85c951ad1060@gmx.de>
Subject: Re: [RFC PATCH 3/7] platform/x86: wmi: Use common WMI string functions
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Armin

On Fri, Sep 25, 2026, at 2:36 PM, Armin Wolf wrote:
> Am 25.09.26 um 18:00 schrieb Mark Pearson:
>
>> The WMI buffer 'string' handling needed for ThinkLMI v2 is done in the same
>> way as on the Dell systems (I suspect this may be common on Windows).
>>
>> Move the populate_string_buffer and calculate_string_buffer functions into
>> the WMI core module so they can be used by other WMI drivers.
>>
>> The implementation in WMI core has a bit more error checking, as it can be
>> less certain that the inputs will be good.
>>
>> Modify the Dell modules to use the new interface and take advantage of
>> the error checking.
>
> Why not replace populate_string_buffer() with wmi_string_from_utf8s()?
> Additionally calculate_string_buffer() will fail for characters that require
> two UTF16 code points.
>
> I suggest that you replace calculate_string_buffer() with:
>
> 	struct_size_t(struct wmi_string, chars, strlen(str) * 2 + 1);
>
> This way each string can safely occupy up to two UTF16 codepoints, with one
> being used for the NUL termination.
>
> You can then determine the true size of the WMI string from the return value:
>
> 	struct_size_t(struct wmi_string, chars, ret + 1);
>
Sounds good - I'll have a look at doing that.

Mark
