Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274221;
	b=A6BBYXt7czOVow9bBg2SDWeQQx8C9g83CZ2cRFbBgfygthXVDsNczpfT0XoUkp6w3u6u
	 bd4TZ9j9pGWfqBx9E74Eadcpcw3xZVcSZ9Fn3yfbd4I1LZfem24tGiXXgnnJWvse1hnVb
	 T+15Bny7l8g9LVmBZpttvfxQGM+/M46uWbghytdPO65fd+l/BN9TybRWqXUsD2CuKTbLp
	 THi3F+bDJBXA0mg8+A3hHQl7iQkzcSWFNfMSGCeZkI8PM7/wnIGdFv77qyHRH17psTreu
	 0/qtmLEtqDrQnFNL1/VnA3O69psnUjgYwpGEii+roW41yN+uiVcmuhcUXjfsZchLBYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274221;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=syxTvc7qi8BxdmObTlmCnf6qDoAgSqafzprUhWd599E=;
	b=N+Jgu+IgY7TaKIyrYmaL1ZS5LFx8BNyfzJSw2qh0fLu64PXwQiRztVJ8DH59oh2lvHUX
	 Eb9xhQoV/ZykIA1c8r+V4qGNnVxTX65cpPNGBhEo0tq+/XR6hCrY2mwreXBrzhTOZMuqk
	 TK/o9GwjMR/Dq47OtouApwJtvqxVyyqZ2c0b6LnlG2MC6SQh4e1wxstCfNwcqtK8AbBLd
	 8lCkIP9d7vGKkyd8HLMBAdOiHaJO/Negg2ZMvqmgBCmpl+i9+PjwfjFUkX4eNYyx9EgBr
	 QWTxGrpz0TpyHYKq4jU96nNXVEEWvYub2idV4upfd32h8McMkhbFmL5Z9l5+SplC9iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=GGo+MO5P;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4UWtiWbE;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD82606A31C
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 01:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DD82606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=GGo+MO5P;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4UWtiWbE
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6F2C07A01C6
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 20:30:19 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Mon, 09 Nov 2026 20:30:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794274219;
	 x=1794360619; bh=syxTvc7qi8BxdmObTlmCnf6qDoAgSqafzprUhWd599E=; b=
	GGo+MO5Pr7cjIddFsYDs9Y8aCnunVWlgll+IciQ52hFbM8Hl0sqaSHc5hlKSI8wr
	9FHauWio8h8KJMuqppd50TD83sVi+qDt2Ae30I/CspB50gaO/wbwzoDYQCECYjgz
	2h3Tn2Tcb9V9H9EZl/6ztG5mw2u1bIRZ2wFx7ULpyw9p0hdY7vCUTWDxivRB21+x
	yueDW+zGbJN46IkowqSUOTicrjckPxCXwv0TN014DIVajMAsutNFylSzNs4v0uM4
	xrDeeus57Fc+Bzfc6CPmHHR+2UajpZFuIa6uAf+i2QEQQX+L3tDG8s1p68SxnqXK
	OlOTrmXg/mcXFBH8ZykjzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794274219; x=
	1794360619; bh=syxTvc7qi8BxdmObTlmCnf6qDoAgSqafzprUhWd599E=; b=4
	UWtiWbEe3Gaa+rDi7ovooNgzsgG9CAgIFNCTlthOC8MV25wEghTuxmXTeHSLioc6
	vc9yIzUbDDEkuJbnPnKVpp+knRX7rrmT6ZtHzo1mnd0M9hL/oDoxTN6moOn/QHZl
	kc+LraXtUhHsENzdaQOdUR7zl3sFe2AsplauWC4QDLv/jCuZRb9s+BQ4oTONhfTc
	1EikxOfKYCmFVRj6nqnF5aIkbUGSstwvtZjLf+qqvwhmR6+GDfuutlUTQfBT5m9J
	Y2NKqUGBxjai423N2QmLNxiXX/pXEiY0oHLnkhpC1HKzmcNbNH2zAYBtjwAvTgS1
	8H8QTn0+AqNNtu7dbSuPg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794274219; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:RWtuYk+AH1m2ncd4QFHLivP3RbWOPcU2vGngsw5ZEmrOoQe
	WfcvrP6+SGXb0EoiJJah1RxKwrP90UcqHBtjNdTbsmh9e8VpvSEJ2GkGGajuUmms
	xIpxlUpp3B+pEtqnBI8JkHr1Hlox+Sm23HyG7Ani8ocj47pDpB2uFjPF4H5kyVEF
	EW41MXpNRvDJj7CXpHS0SnaRkfhcUIYip6bI6y/3RkyeJIXEThtriuJTwl+DkROn
	ye/VwniQ0MxeqyE8XrAAxgxbmBRyS3TU5V45iPZnNHJv8aT2ZhNkn8U6brWVPvzq
	eoKm7aHgPCIhC+lZdqjX+NA9bcPHURweUVSZ2iw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:aYAaMAwAx4tGVzpdLzidEL52HflVGh+8rTiP/rK39Bs=:FA3j9VS807PfP6YcpaYrVXD2uvSCuUDt6khf2waFoeE=;
X-ME-Sender: <xms:qXPyajOKSFe9saU74qH5GIaY6Y4g_ZGCaD2v8YFnfClcK2ySp4EjmA>
    <xme:qXPyaox9n9JFh_bBsq7wmTzj9QZni2YTcUIt05qQp98g9eI11pAbgJQIRwOBbAqJy
    wvpnCVOvCLlIkoZmV0B0rtZPRp3MfbrfBisSQnttiWod-9P9eHzgL2r>
X-ME-Proxy-Cause: dmFkZTFsE1tf4QLvG7oixZwfQyB5Gerw8tGI6y0d+/avNWyRBA+lQmtuXbJh0g3K9KxISF
    eANjQoniCqEHIobXmMUD2cMjyruApIpEoRJNGFVYHwr7yK7HFjBQuVZIygajd1XkY4eN72
    rXPVka7hJTedX31IurGsJtsnpY9kfzW+cI6Bx4oIri0ep0Hp/enzsfigfimqw/OpqqYgNS
    1tqzy84h0tmAZHRBtJYc9IHKHqd+W1CoKxKDrGjLpoWUxYNoEI3iyil+896vReWNl/o2R+
    XZNDS1mrO/EYa8QJyUdgnu+54nkikO4CfqfzZMwQfZgGiQF16bz66pLkFAizYcoxmlpXVZ
    12TFJ4q4tTAurPMOnsLL/r73tYwWgmcCepgF5rVhOjo0GHzeUnTMrn49jBl2FiWUhfxqOJ
    FfoI4KjEEDzm73A3Mdml3C/fTFW47lEEOQqjvebdZh0gyIdGe/SHipXGc7D46SaYh2YC+f
    XEYUX9FsQYs/kK3Ywn1cVMWeFi06a5/DEeXRldVTWRJXyKHTg1OgphMuG85AeJqK/mtja9
    yxJ0avs5vt1HGHWO03Rd3yebAO+Eb+E3VgqUYvkRLWOdGLoPlJKeNytTN1a91ooPBDinVJ
    yWRanX0UjiBbtYzaEyQxJ58P9m/xauM71Po4ovbz4rJHMJfylyB5HDIASX/Q
X-ME-Proxy: <xmx:qnPyapx1z-u1RNA4Ch_pkFlNtO7K3gmyCwKVKh1p5Tw0n6QPlAzxww>
    <xmx:qnPyahdMQUG_-9kRnEKFx1yZBKCwY16HXxnBpYc1Ou_bqoOsBC9CrQ>
    <xmx:qnPyau7R2BPXrGAO3EP7z0uu7PnTmAKyBp5OEuK_ZOO-UMOncKH5lw>
    <xmx:qnPyamK8zY0hgH9eDBTsfLSrlWTBt4B3En26_DKtJDJ74Ew1YUJ21A>
    <xmx:q3Pyahgz5FgSIESX1hZxouZz2SsgrCXVsidfhJbS1Meofovi2ASXqMLM>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 5BC842C00089; Mon,  9 Nov 2026 20:30:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AovdxG1t0Brw
Date: Mon, 09 Nov 2026 20:29:57 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Punnay Sharma" <punnaysharma805@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Ike Panhc" <ikepanhc@gmail.com>
Cc: Artem <temmi556@mail.ru>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Stuart Hayhurst" <stuart.a.hayhurst@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <4a8b9f29-a034-4709-9610-aa8cad567eed@app.fastmail.com>
In-Reply-To: <2083b714f5f20e86d76629a9ec334c0ce0e05774.camel@rong.moe>
References: <20261107140700.16036-1-punnaysharma805@gmail.com>
 <2083b714f5f20e86d76629a9ec334c0ce0e05774.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Do not warn if KBLC reports no
 backlight
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Nov 7, 2026, at 9:49 AM, Rong Zhang wrote:
> Hi Punnay,
>
> On Sat, 2026-11-07 at 19:35 +0530, Punnay Sharma wrote:
>> On probe, the driver asks KBLC for the keyboard backlight type and
>> warns about any result other than 0x5 or 0x7.
>> 
>> The LOQ 15IRX10 with an RGB keyboard returns 0x1. Its KBLC sets bit 0
>> in every result, and sets bit 2 for the type query only if the EC field
>> GZ35 is 0. On this model GZ35 is not 0, and a separate USB controller
>> (048d:c693) drives the keyboard lights. So 0x1 means that KBLC controls
>> no keyboard backlight, but the driver logs on every boot:
>> 
>>   ideapad_acpi VPC2004:00: Unknown keyboard type: 1
>> 
>> Add KBD_BL_NONE_TYPE for 0x1 and do not warn about it.
>> 
>> Tested on a Lenovo LOQ 15IRX10 (BIOS R3CN44WW).
>
> +CC Artem.
>
> It seems that some devices provides functional KBLC despite
> KBD_BL_QUERY_TYPE returns 0x1. See
> https://bugzilla.kernel.org/show_bug.cgi?id=221198
>
> Mark, Derek, could you check the documentation about keyboard backlight
> type?
>
> Thanks,
> Rong
>
>> 
>> Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
>> ---
>> KBD_BL_NONE_TYPE is placed last to avoid a conflict with Rong Zhang's
>> pending keyboard backlight series.
>> 
>> The same warning appears on other models, e.g. LOQ 15AHP10 [1] and
>> Legion 5 Pro 16ACH6H [2].
>> 
>> [1] https://lore.kernel.org/all/3f03931e7eafcb1781ca3cf922e588ab57caadcf@lavx.hu/
>> [2] https://github.com/johnfanv2/LenovoLegionLinux/issues/336
>> 
>>  drivers/platform/x86/lenovo/ideapad-laptop.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
>> index fcb5ed7035f5..eb4158bed264 100644
>> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
>> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
>> @@ -148,6 +148,7 @@ enum {
>>  #define KBD_BL_QUERY_TYPE		0x1
>>  #define KBD_BL_TRISTATE_TYPE		0x5
>>  #define KBD_BL_TRISTATE_AUTO_TYPE	0x7
>> +#define KBD_BL_NONE_TYPE		0x1	/* No backlight through KBLC */
>>  
>>  #define KBD_BL_COMMAND_GET		0x2
>>  #define KBD_BL_COMMAND_SET		0x3
>> @@ -2246,7 +2247,7 @@ static int ideapad_check_features(struct ideapad_private *priv)
>>  			} else if (val == KBD_BL_TRISTATE_AUTO_TYPE) {
>>  				priv->features.kbd_bl = true;
>>  				priv->kbd_bl.type = KBD_BL_TRISTATE_AUTO;
>> -			} else {
>> +			} else if (val != KBD_BL_NONE_TYPE) {
>>  				dev_warn(&priv->platform_device->dev,
>>  					 "Unknown keyboard type: %lu",
>>  					 val);
>> 
>> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8

Afraid I don't have any documentation handy, but I reached out to the Thinkbook team (using the BZ ticket) as I have some contacts there and they might be able to help. Will see if I hear back.

Mark
