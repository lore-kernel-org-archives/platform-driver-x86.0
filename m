Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=120.232.169.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090343;
	b=CVhJMZEPrgl+ImDMSaiiHOq/noRneCiEY6mZFdod5sMUyxYxzKRj3zdXSXxK2WNRLNVc
	 /FrQs9uvtb39suHuANoBe8b4MnhCguI9GefOJyEAIEZYONsNozmNsBnrvKDrg3YUoDWct
	 HAyrZQRtbfBPieFxHyGTI/8I8rm8SPsQn93W4t/QetUWwjrplfp9sE7mjXaz90hmdGS9e
	 FTqWRLcy5Xr232k8yXvZxg/o+nEWMsvEsnGG4E158u5I/S1y6mDc207HSAOX8GXb0dYu1
	 KLH4GalGavG5xekeguEeUVDHJe4qpt7e0v1TICETAcH6+kLyu/TZrzY7TRGFPibWReA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090343;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM:X-RM-SPAM-FLAG:
	 Received:X-RM-TRANSID:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=oWdhl+3A4logPSwrT8mcDtJzFFpOpMg+JsoMjrGrs5A=;
	b=3UDT6PgaXWYSoA4XhDp8ckEPHzj+0r3CXOrlysgydqF6AyEI2xq7r98NFGWmAcj2oSE8
	 dbzQEHDMFwPK7avkSnvdaE/g0X2DAuuY7cuxKk3OOmuK+lGUVwrFRMw1iBRNfkPgh8UYr
	 9CnAuCmYaOMJhDlsE0kq31rdxHmRpKL9xkJmPFKpCMs028eHfqD4Nq0IxCdhXuxwdwOtF
	 1ZwIqdOC9wMeMU/xo2C6NbFRs4hoDRGDtaTz+UCJ4E0y7FMqi6qIdSRa+7g32pv7p+/mq
	 cXJEss9WmumE5x9/1YhplTQhuAbkLu7Pu4rhBKstYXf82kXoJ5ZjgmfTvuO82wwKgFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=139.com;
	spf=pass smtp.mailfrom=139.com;
	dkim=pass header.d=139.com header.i=@139.com header.a=rsa-sha256 header.s=dkim header.b=V2NBtlXU;
	arc=none smtp.remote-ip=120.232.169.111
Received: from n169-111.mail.139.com (n169-111.mail.139.com [120.232.169.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF30A60A2610;
	Thu, 19 Nov 2026 12:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF30A60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=139.com header.i=@139.com header.a=rsa-sha256 header.s=dkim header.b=V2NBtlXU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=139.com; s=dkim; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=V2NBtlXUNPZs2iLulaPVkSvvuul8KfpgxLcD4qb4tWzkxZoJm3RXa12qusXYIvj1DltmYaS8mV8ng
	 Qhnv+chUW4EbPjIHqX57LCqzpKviKIgH2hM+NB97W3TpHKIvNFNRZ3PA5eDf/PJp3EV3QNoLO74nTi
	 omSj9kP3JmGq8mH4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from [10.103.150.92] (unknown[36.110.60.250])
	by rmsmtp-lg-appmail-11-12089 (RichMail) with SMTP id 2f396afee7966a6-016c3;
	Thu, 19 Nov 2026 20:12:08 +0800 (CST)
X-RM-TRANSID:2f396afee7966a6-016c3
Message-ID: <29824d258033bd712497e2e1e0f9612bf98325fb.camel@139.com>
Subject: Re: [RFC PATCH 2/3] platform: lenovo: add WMI hotkeys driver
From: Jackie Dong <xy-jackie@139.com>
To: David Cemin <dcemin@nvidia.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de, 
	mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, ikepanhc@gmail.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ldemarchi@nvidia.com
Date: Thu, 19 Nov 2026 20:12:07 +0800
In-Reply-To: <20261119022922.3090399-1-dcemin@nvidia.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
	 <20261113222755.1696567-3-dcemin@nvidia.com>
	 <20261119022922.3090399-1-dcemin@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-18 at 18:29 -0800, David Cemin wrote:
> Hi Jackie,
>=20
> Thanks for the review and the Reviewed-by on patch 1.
>=20
> On merging wmi-hotkeys.c with wmi-hotkey-utilities.c: I kept them
> separate because they are different interfaces. wmi-hotkey-
> utilities.c
> drives the method GUID (microphone mute LED, Fn lock state), while
> wmi-hotkeys.c owns the event GUIDs and only turns events into input
> reports; the notifier chain is how the two sides meet, and ideapad-
> laptop
> uses it. If the maintainers prefer a single file the merge is
> mechanical
> and I am happy to do it in v3; otherwise I would keep the method and
> event
> sides apart, as the other Lenovo WMI drivers do.
>=20
> v2 is out as 20261119022719.3089229-1-dcemin@nvidia.com=C2=A0and includes
> your tag.
>=20
> Thanks,
> David
Hi David,
I agree that wmi-hotkeys.c and wmi-hotkey-utilities.c are different
interfaces. But I stick on my point that the two file names are
similar and easy to confuse for developers and maintainer.
I suggest another file name should be a solution, such as wmi-hotkeys-
switches.c, wmi-FnKey-event-report.c, FYR.

Regards,

Jackie

