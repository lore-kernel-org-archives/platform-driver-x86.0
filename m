Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.85.9.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604198;
	b=KddTeLC1SDFW9c7B2RKbTYq5eOHMbiSzAa2GnV2Jj9WtdTLH5kbCbgnJJlflRsDKvQ+E
	 BQIbbSUuIrgWPA9oPmDbZLzMuum+i3M1WoU8dRB/eS8b9wlS2zEEEt3W3/RAKssGdjrSZ
	 SBidLZooQIiSgqPG+OgK5rS7Ns/4NvIV5KcEEKfeDTwFMZ/D4bhErSGteBhW2E9Ju2IAE
	 oSYe+6InScc67t+Y47sTDCBN/HWpYRsv+BEysPF3fKN9Fkh4wBGTUu7+LFZpJqZotl7CC
	 cyhjbETq5peMcM+1y2Lc9ueDVkvUGEbKJEWPjUq/mcFOcFtMO0lb48QjwgazCeLTcjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604198;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=xmtxT7oYUiwf5fs2S3Ne6KCnRnQkp7sKeotrRv4+JTM=;
	b=Gp0HhSo3R7V0JlVG6zeqLtpuHeW+dNT7HpUM9MrFR53suTrt+qC4m1tmBLPcumpZin+f
	 5Q8/wCQXqKjHb7/JMHfSYKOCT6MVPPeoXgnkMg3uiMTxlUx4jcEevXPKEELlnkAwV5BR9
	 w4LZdRQdokpNKz0OzeRC4RR/43G/2WAlgk1CFoqQQw/6S3vaQFQY9Zo4wbR1hElFwqD8j
	 ZsTL6X2Qi1cwMoU5/wsM/vt42HIjyRZP/ZU3SzCuBeS1dKcf0GW8Z24QcWYkOYi6hcbFD
	 o66UUWVwb+eE10VYjcJf5Fa03uLshNNF72CXJyNfBuFNKpcuAocrWGsY1L2ObBfXUQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=irl.hu;
	spf=pass smtp.mailfrom=irl.hu;
	arc=none smtp.remote-ip=95.85.9.111
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id C2F4F606A321;
	Wed, 25 Nov 2026 10:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2F4F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b695b0.dsl.pool.telekom.hu [::ffff:81.182.149.176])
  (AUTH: CRAM-MD5 soyer@irl.hu, SSL: TLS1.3,256bits,ECDHE_RSA_AES_256_GCM_SHA384)
  by irl.hu with ESMTPSA
  id 000000000008120F.000000006B06BEDE.00015605; Wed, 25 Nov 2026 11:56:30 +0100
Message-ID: <84a3d94cc78ba0a26ed7b0af7cfcbde65433aa1e.camel@irl.hu>
Subject: Re: [PATCH v2 6/7] platform/x86: ideapad-laptop: Trigger the EC on
 YMC events following Windows behavior
From: Gergo Koteles <soyer@irl.hu>
To: Rong Zhang <i@rong.moe>,
  Mark Pearson <mpearson-lenovo@squebb.ca>,
  "Derek J. Clark" <derekjohn.clark@gmail.com>,
  Hans de Goede <hansg@kernel.org>,
  Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
  Ike Panhc <ikepanhc@gmail.com>,
  Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc: Eduard Aliman <edialiman20@gmail.com>,
  platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
  Mahir Faisal <mahirfaisalantiq33@gmail.com>
Date: Wed, 25 Nov 2026 11:56:21 +0100
In-Reply-To: <20261125-ymc-82yl-v2-6-624bdcb3c50e@rong.moe>
References: <20261125-ymc-82yl-v2-0-624bdcb3c50e@rong.moe>
	 <20261125-ymc-82yl-v2-6-624bdcb3c50e@rong.moe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Rong,

Thank you for taking care of this.

On Wed, 2026-11-25 at 02:17 +0800, Rong Zhang wrote:
> Currently, the ideapad-laptop driver triggers the EC with YMC command
> 0x01, which seems to be randomly chosen with trial-and-error and turns
> out to be not a command for YMC events. While the devices in the DMI
> quirk table recognize it, some other devices do not, making the
> trigger_ec functionality a no-op.
>=20
> Lenovo's YMC driver for Windows (YMC.exe) emits YMC command 0x08/0x09 on
> fold/unfold YMC events, in which "unfold" means laptop mode and "fold"
> means other modes.
>=20
> Adopt the said sequence to make it work on all relevant devices. For the
> sake of caution, only emit YMC command 0x08 only for the known fold
> postures. For all other postures (including unknown ones), emit 0x09 to
> make sure the touchpad and keyboard are still functional.
>=20
> Reported-by: Mahir Faisal <mahirfaisalantiq33@gmail.com>
> Closes: https://msgid.link/CAGAHqH6o0TUa1HXMrNV6e+HNYwU3xxHkOM665756n8Cp3=
AzhVQ@mail.gmail.com
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v2:
> - Fix typos (thanks Mark Pearson)
> ---
>=20

...

>  	scoped_guard(mutex, &priv->vpc_mutex)
> -		ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_YMC, 1);
> +		ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_YMC, cmd);

Unfortunately, the 14ARB7 does not emit a SW_TABLET_MODE after
triggering the ec with 8/9 or the fixed value of 8 or 9. It only works
with 1.

However, it turns off the keyboard and touchpad when triggered by 8/9
or 1, as well as without any trigger.

Perhaps the triggering should be handled on a per-model basis?

Best regards,
Gergo
