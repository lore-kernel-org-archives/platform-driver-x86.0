Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE59C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Mar 2023 17:55:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjCRRz1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 13:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjCRRz1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 13:55:27 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578D415C97
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 10:55:26 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 8E01932007CF;
        Sat, 18 Mar 2023 13:55:25 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute5.internal (MEProxy); Sat, 18 Mar 2023 13:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1679162125; x=1679248525; bh=S80+1lygmC5Z7bLrPpyFVB3sKTxMdSaw8md
        qpwpvjf0=; b=o8GpvQA64EO7xyCfeN71qnnX1AftrSGEmJyNiKq86SQPD0l++Nm
        6VI6fF8CPeV293oo8hD9OwogNsn0J2DoQe+iYaS2zl+gEenGGVo0wK+m60roB1t6
        NlipgCjsPHU94e9lBR2muolA/NPxrAbRX4OicWguPLwnedjP4iaWsMcO6YDZXFiX
        DjhXUIIfsutrzogBzNT7BfrcRs+yAvsEuDevSG9JLJI35UXatjE/VOalnkIIETNh
        UIVkJ9hzBwLTv4X9uSCR1vXEFy/7mvmRvIC49u/MiKqPQQcQ+jWgfcr6GWFUeKE1
        JA7sKX7QD9/BQJuvtG8RAB6G6lM7wPU67mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1679162125; x=1679248525; bh=S80+1lygmC5Z7bLrPpyFVB3sKTxMdSaw8md
        qpwpvjf0=; b=CxdZld3OlmMpxCwUfWycV6tUG+Jac5HbWdwIjxQwsBe7ZAJOnt1
        E4jPC1UEODvpmbRKQDLfeompP5VwXuoMuPY++MILGKdcHL5OtX+4CynHE9fdXPQ9
        HFSA8thV/bVzOHD+vvsLJ3eu9SJZT6Uo2oFo9XFxUN5hLLAKKthTo9zxmUUeo4+8
        QfE0V3qiSsL0DQRkJNgWGGcysQHfmHK8gnW5mTpIHowtq00MDOYkoU1CM3YXpUZD
        DlqA/2U83b96PnLPtSNox5OM4PCbju+dq+Gx6zu6bD2IXmMXgWB5UQv6wn4tSGuo
        i07FYBamc3msbrOVVHDBl2ogeyGHK3aQCSg==
X-ME-Sender: <xms:DfsVZNEXDIxygLPjdU_hGX5QIaiGlYV5doXqS-tvQo5BN9APxD6hnA>
    <xme:DfsVZCUGLvnGEf5-ru1lDFjOg6zw0bP1zWn13tbUOQpxkjIg9yMCuoBUwA5vc4Ikz
    fWjzcJjGRCgENnO4fY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefgedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    ofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvg
    gssgdrtggrqeenucggtffrrghtthgvrhhnpefhfeegudeftefgteelgfekgfdvjeelleev
    gffhjeffhfdtiedtjeefkedvuefgkeenucevlhhushhtvghrufhiiigvpedunecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdr
    tggr
X-ME-Proxy: <xmx:DfsVZPIzmikbGji1PKoXQEt80pYXubzxXDp4jKUy2Xtv8dplqRAtQw>
    <xmx:DfsVZDH2TkVnwEaFLSHyJFhfcKb8p94UWF7_n2e2RenTwfJewr_tug>
    <xmx:DfsVZDWdPiOR-rhOZP-sZ9d9qepFo5_9QcO0-tK1w7ewP25N4XFMuQ>
    <xmx:DfsVZAg8Ks8X98isRLWPOoamtJK_otNF0UXVE9XpHShW__CpioSKpw>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 048FBC60091; Sat, 18 Mar 2023 13:55:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-221-gec32977366-fm-20230306.001-gec329773
Mime-Version: 1.0
Message-Id: <56d71f0d-e387-4fc4-8e41-1eab9ed571ab@app.fastmail.com>
In-Reply-To: <NJCYtxr0cVaE6xV-cHfKygPgRYvPzrouaGcTSI-Is-n6pzo8AQl6kek2MkDEQBB6hJcwC9Z7zfqq5NapyIHTHgllYcwMYebQ6D-CCOKG0FQ=@protonmail.com>
References: <mpearson-lenovo@squebb.ca>
 <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
 <20230317154635.39692-3-mpearson-lenovo@squebb.ca>
 <NJCYtxr0cVaE6xV-cHfKygPgRYvPzrouaGcTSI-Is-n6pzo8AQl6kek2MkDEQBB6hJcwC9Z7zfqq5NapyIHTHgllYcwMYebQ6D-CCOKG0FQ=@protonmail.com>
Date:   Sat, 18 Mar 2023 13:55:04 -0400
From:   "Mark Pearson" <mpearson-lenovo@squebb.ca>
To:     =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "Hans de Goede" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "Mark Pearson" <markpearson@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] platform/x86: think-lmi: use correct possible_values
 delimters
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Barnabas,

On Sat, Mar 18, 2023, at 10:37 AM, Barnab=C3=A1s P=C5=91cze wrote:
> Hi
>
>
> 2023. m=C3=A1rcius 17., p=C3=A9ntek 16:46 keltez=C3=A9ssel, Mark Pears=
on=20
> <mpearson-lenovo@squebb.ca> =C3=ADrta:
>
>> firmware-attributes class requires that possible values are delimited
>> using ';' but the Lenovo firmware uses ',' instead.
>> Parse string and replace where appropriate
>>=20
>> Thanks to Thomas W for pointing this out.
>>=20
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> ---
>> [...]
>> +		/*
>> +		 * firmware-attributes requires that possible_values are separated=
 by ';' but
>> +		 * Lenovo FW uses ','. Replace appropriately.
>> +		 */
>> +		if (setting->possible_values) {
>> +			char *tmp =3D setting->possible_values;
>> +
>> +			while ((tmp =3D strchr(tmp, ',')) !=3D NULL)
>> +				*tmp++ =3D ';';
>> +		}
>
> Please see `strreplace()` from `linux/string.h`.
Ah - I looked for that and didn't find it. Thank you (and will do)

>
>
>> +
>>  		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
>>  		tlmi_priv.setting[i] =3D setting;
>>  		kfree(item);
>> --
>> 2.39.2
>
>
> Regards,
> Barnab=C3=A1s P=C5=91cze
