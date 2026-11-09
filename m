Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794229640;
	b=cS45e8845kTvsS+AhfNylUasY6W0r8HSCf0LcXfB2Wx4ge49xw7mkp7SY3tMORdocQxy
	 H6d7uAh6wmB047sbe5WiBrU41G9onVsGrDkmhVuvNoOYgl/KDCqvS1lyWqzLSwuLV9fF3
	 3tjlpCVaPjENc98LOMMWAOCRszyux8AIYkH+L2UMYzIQRPWYWXo0CmG9KGkh7X5ijWNWF
	 g5pLmUMgOqlIdcE+PG9/QXCMnHJuy3H3Up0UaZ/fYJRWaE4tSw+zeXkOmvFlgo5H0V3kX
	 pHh71ADEdCcDByBAE5pCuRm5WUaoH2HiqCZDUWI7b1NkZozycenNIGg3VdSEoLVp4Kg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Uk7n82+g2dJnU83fWDbv9zCLU/mM8vD3TMomniFJ/HI=;
	b=eqGbBW/GvwXbmHgZTTCvvKfBXcvPPQQsq74sD8avsc/r8i55HzqxoFyQkUOiimT66Xdj
	 +7vYdmyAijWuPYqjSOHERX1enq/w/V+L293R6TZyAg+qnMKc/Xf3sX2k0yhr4huiv261l
	 GokrCdJpbcWNg2z1XYZw4rHG9u0wEXUdUnKj2IYtU0I0kulHe7OLso2hQbN03OWrwtMrJ
	 DBj2yilo1hW+C3YYZNTHuTv74L8jK0ROhYtBOTAFqtsQMW4Jf6o4k1WeIssDGuwd43xgt
	 Gd4ed9PydRg9b3bsQXubDq463x5wHodkEiHhA6nP84i+9XjEIyf4Ro2xlnWeEig8JqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZNDVHIMe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8E6606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 13:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZNDVHIMe
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso309912a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 05:07:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794229639; cv=none;
        d=google.com; s=arc-20260327;
        b=FTK5vMNQH4OfkTVC5z7qFLq1card/osPIadDM8xnATB9G34sfSxZO6Et1hwAJLhEUq
         Cy9uHswVzsPc1c3O3wEjyesHVjAtQfWxXqoiVbaAHtnqDE7RCQ9RAYRsNnHyEhGp5+8D
         MqpcjPqHtOFjlo/GfDmvFouviSn3gJUjYdU2JXE0SqzXaKSeFNpIjk2KSZrsYhGjuLun
         k4jUX5wWB1VDsN5OUS3BJIQORpJHU0OX/bn5x13Rnuf+IzVLACVLN93G1FMmWNEW6nGB
         Ttd0pSLed9o8KeTzfVPUaEisPKDS/5G6in0H/xTF1hUU3/RebUaxjkoFrLKL7V8bNr9X
         zdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uk7n82+g2dJnU83fWDbv9zCLU/mM8vD3TMomniFJ/HI=;
        fh=YLEoDtbKL1aLfhD5tMQScjkJvcBKCkJA6QKs6ZBCyX0=;
        b=b14iZfoyxcLx0OocqJKDXwwbj+6U1sFnzyvPriUi6mQNdqdMBUCy0w7OSujb7RQn+U
         cSUWgqZOFEhU0BfsuPsL1NiMLC4Rqib45NsBm3JK1wIR0wtZ1OgAaXFC/xhkvHeKvXzh
         rWjxzvvUn+aIcsZvIQfd135Gvg7LB/IoZoyOi/T1iB3G3nEMStfxirU826t4YS973S6x
         BlaFfmoYKS+ZyOQoaD2ppAgxv3k3avzyIybwTBaQBndtArlIGMyDCGPRkgsxr17MFFT+
         Db/8WOmh7fsL9CMxZMSHNB+A979yZEkwuoUxOAxaSiDJoDggvKwN0yow3iTCZ4WxwVrN
         tpWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794229639; x=1794834439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uk7n82+g2dJnU83fWDbv9zCLU/mM8vD3TMomniFJ/HI=;
        b=ZNDVHIMeBwkQzIiqzNONeQTg25iqC/i9IZQElQRj9V3CDaChiXVudoyBUK1x/Yx9LC
         K0U+ciwYwEjmsFJZpcnc3oWAWsjx+bsJMfAs8UukZKNnbjX3MUSayQdi9HgukXtquNOT
         h60itKorMNMljfRhzXzJKG0VqazsqPFdWk0R5uq3b8bq9xXprFBIAK42ckKEexj728IJ
         RpeC2MGsA8/kfHriK+ReeGhd3017cyZMcDRiwMxjgvy8IfvLh4cIJrw8ZzNr9N9t7Dsh
         fyqplaKHTAxD28RpUvkjwbB8o0RgQeAKaStdKhlt/IWcamPrI/QrsVtyS7RWxRySXx2A
         Z7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229639; x=1794834439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uk7n82+g2dJnU83fWDbv9zCLU/mM8vD3TMomniFJ/HI=;
        b=XOFlHpZuTHWDtD4JZ6zBjgk21xtPfXY6IZzdK2sgs1BEZbP+luRTS0uRPUiIUGO27W
         sf6STr1MmTkFmkzyP9R5pv3QigL4W9Lab8t7jkTVJiotoHsgze2rbmK4MBya9ZF61TEX
         9kzu2qKes7QJd0hPRMp6h3nk46TsdgDseWTpqcOkqXrHKdYGT+93AEK2hfXRKDWj7lY4
         hFY2cUW9rC8rZKtxgrSzFulZOmLf0vRbehXmTLFas5FXJlZe4k6X0dShsA+v4xkg832p
         nWIswMWakJlefcXcJ7aVh/Z6w60iF48mEDFXq+EvM1u6vKkoVRVa/hwdzYJsqKXW9Vt/
         pRHw==
X-Gm-Message-State: APuU4Z/EPF7HefvWNJsB6uzcmxs5UZDM8uQbb9gtMl/lEEWLmqAcCKSc
	wmWAfucLHhvegvcyQl3EDbxuvR1e2GhfEpvfELD3oYAkNFpTlHwRDmdym++AyGLQE1x8GjTwxwi
	ey6zNRQmcumYZ8IcWEAQ+CvRY4tQ8yF6qttzi
X-Gm-Gg: AYBFou3PIF5BryRXltvOR4IrD+5ZWj0Am/I7nYy/NMuSh2iyvWrKMtQrNykSEw/2gXo
	TH4I0ewXLv94dnpWhYP2XY1F3Iw/LW/+edEIOycS4ABvPxS0zwS0NSFazYfVrcUl1fNUnu2WPR+
	RCF8PNw3dSGOKQcSeMngiDJzlJg3vsJGAR5O5yIlT9pbQv7gFb8XwdEzbrG/QOA+3XyfQmY3OaX
	Qr5FvWJA5uTQ1FETMp+k/TyC3u5WzVM/h2HUpZkWsyHL79pyDjhh1QCaFXGHNI/Mv7/YvqB57CH
	1Ve1MEz50c5bjWYhbre46wrReYSCdeOGgo2adHQxoPsSdZPFNjK1Zw9Nm7RL5Dfzd3A3n3QDiUx
	vbliEMzJIs1uMEO3wyGRHxrGtkWoRlO4roCCzYzI=
X-Received: by 2002:a17:90b:3c01:b0:3ad:b86d:dbad with SMTP id
 98e67ed59e1d1-3b12d4b4a34mr3647607a91.30.1794229638998; Mon, 09 Nov 2026
 05:07:18 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFbNUuJGjo5OW1JZhO=uXqk07fmzE8yo2Qibe5PoOtHCmoQXpQ@mail.gmail.com>
 <ccc319f4-24aa-496b-8366-fcfdbd5dbce6@gmail.com> <CAFbNUuKTvJXoNqf-5K7VykOHtFFVdVHTc50aYswC0if4eGQN8w@mail.gmail.com>
 <ecdecef6-b2da-4d3e-bb82-a22a15febaf6@gmail.com> <CAFbNUuLXaP4_257tWkr-09n9h9yZX_y772LMStPY8QuGOWAipQ@mail.gmail.com>
 <eb504790-1f37-4288-9f72-0a3d7b10af3b@gmail.com>
In-Reply-To: <eb504790-1f37-4288-9f72-0a3d7b10af3b@gmail.com>
From: okluar <okluar@gmail.com>
Date: Mon, 9 Nov 2026 16:07:07 +0300
X-Gm-Features: AclHuK_sO7DJ4bp7UQfhJra2XUjXUSuJWD2Wg7tmHmmCU9JYjq-2RpXa108SSYI
Message-ID: <CAFbNUuLmaoq22pQPzrUidJ+RC2xf2u5Ovxzy5d0LQZ7owH52OA@mail.gmail.com>
Subject: Re: [BUG] platform/x86: bitland-mifs-wmi: performance profile fails
 on TIMI A30 (USB-C only)
To: Mingyou Chen <qby140326@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 1:16=E2=80=AFPM Mingyou Chen <qby140326@gmail.com> w=
rote:
> Hi,
>
> It seems the expected function id doesn't equal to the actual hardware
> outcome.
>
> Could you send the hexdump of the wmi call result?
>
>
> And by the way, I've included this quirk item (accept_zero_function) in
> a previous version of the patch,
>
> but I dropped it in v14 because I consider only SET functions take 0 on
> their function id in the wmi call output,
>
> and all devices have this behavior.
>
> I could add it back if the problem is confirmed.

Hi,

I added this print:
   print_hex_dump(KERN_INFO, "WMI DUMP: ", DUMP_PREFIX_OFFSET, 16, 1,
out_buf.data, sizeof(union bitland_mifs_output_buf), true);

And here is the hexdumps:

Power-saver:
   WMI DUMP: 00000000: 00 80 00 08 02 00 00 00 00 00 00 00 00 00 00 00
   WMI DUMP: 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Balanced:
   WMI DUMP: 00000000: 00 80 00 08 01 00 00 00 00 00 00 00 00 00 00 00
   WMI DUMP: 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Performance:
   WMI DUMP: 00000000: 00 80 00 08 00 00 00 00 00 00 00 00 00 00 00 00
   WMI DUMP: 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
