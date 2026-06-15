Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B05403EBE;
	Mon, 15 Jun 2026 15:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781537332; cv=none; b=b0xXbm/xON1FMP4v/tMqptQ/d1OTbq1mShGSO/25W2zxGkqWMUI8ppXgbjv9GWKGOQAkapldEAnP+zA1lQAEyRtPmI7aWIeV2agfru+KEw6P1sFDp6u/v4Cr2bJcIxevW7bfh2VRtUY2ZiV8w1rCbmEmPAE4qxIdgmBSQvsC1uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781537332; c=relaxed/simple;
	bh=nRGZ8zRGFC4P+Dcf74jdC9byS6caxuDegu6vCw/eFTg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FCf4PF3zy6Fd/FQCaIlAMFkw+/Dyh9WjcAcFmv6PDNj/Dkt3vazwjNYM8RbYZZ0pb0OsIoMCkV4J1mkxe1OHByyjYYfQ2Bs1ikEunD6kvHrep9TM2VvWU9TEBmVbKy1+7t8vS4ODnVZfzvipUHFwLx0aeJyF9EbJJoPqsz/fW8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=TK22iPSB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cC86WWRs; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="TK22iPSB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cC86WWRs"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AEC2B1400034;
	Mon, 15 Jun 2026 11:28:49 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 15 Jun 2026 11:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781537329;
	 x=1781623729; bh=BaulR5MoKcRJXvKC0DEUDF0Ruc0c+G4aHDV2lmOYuPk=; b=
	TK22iPSBl+8FkCktgVBRC2rzxiqSyEKe9CvTm1TQvYBNfeE1N7zZWnJAmjrVWnIM
	tYbeQ2j1UzsiRoljr4ZfShPR2mSjU1SZLdgmojQmI9fytpXtR+u5EoF38Tf+63hS
	gQyZpafSmxhMUU4qyN22ShhYwNbfzhJDdTT/c3jZSyyH2Ly/EPZI5pnN0hLMV7Zu
	nDl3+AiytLsh4EgfTZyIoAY7Kxo/82Z2xFGfXN3NhOIAXOyqEuObj4qzx44B4VSu
	EfONz8Pa1D8WKQZNFWQHCILu/0KUnNx+1/qL4gnWoSV3JNAkR8R3YbMm5sI+3eGf
	jqE/4qcwsFOS8r6xBSruUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781537329; x=
	1781623729; bh=BaulR5MoKcRJXvKC0DEUDF0Ruc0c+G4aHDV2lmOYuPk=; b=c
	C86WWRs5Zvg+IthMER36d3Nii+MLIWOPWsaRXfll52sKj41tetTA+FRAeMk6QNJ3
	9+18fFl8KzqXr+r7ScTA8UThZefWOv3ApcIP8x7I2gkPaQxeWEff7FCJkv6KMHkR
	KjlM0o2wy7u9T++AqCcDKqkfM5gtLuCFK4WULcbvVu1Ph/WAsUFTl/n4ngCbHqt1
	paYeEaUOLE23vU2Acafu15X0p62rN8TPYBHbzcvobpFizlFb2m1pv8x9kHf8NB4b
	kGVGagn9cErrraxyUaqZgQCkRu9ZKBz8aO3LhznaIA8l8nIE+qwedezGKH/bIb0l
	Gc2XO4+YWVF5+GeCgFj1Q==
X-ME-Sender: <xms:MRowavZAJNhhH0wIC4EMPz8EEYfIiXXUV_OdZlYzPW1hyNym0ROPaQ>
    <xme:MRowapOAI6wD-48UyEsCtWc0K-D6T3ZJRvNbg40w6hBt51e3J42f56-5dQOSv6XwK
    RGKNNy6khiCEQn-lRvFwC1wPI_e3iBqDpfMGOP703wMmHXPsnzS3xo>
X-ME-Proxy-Cause: dmFkZTEylX8mPu8vlpBm+r8jm+E+2bXRFgRqMV70qaPhPC4rLx+lGegg3mIYJOZ8J9uX7u
    7XQ+fJojdO0CfpTifSXpttrQLa3ee5ibnbtuBi9Wfrh8hLbIUykbTcfDNYsSnXVn4x2OqJ
    KDopE3QO/CdgT8fREwn9+hYrEObA+dHPaeKZSxx/8D+0b/h5E4ar+SFTXhkwQK1d7mX5Tb
    AzEoukuicxjGdva4lzwven68Nyic2qRao6a/iFNuguKTGyfonZJEWK863jGa2A4FKYyfGx
    IzOpzkaDu275qw4lu2lXjPRwwqcM7BggcpdxBGYtrfy+O5jlKz+IH8Bm3jCkELkc+jNdV1
    nrxf33dfXoSlf25hi/dJ0p+7UdWZWbljHe5omiCrcw7AHqR18SNdXff3UpZRSDAbXvoqlb
    NV3D8p0A23exa+rW8ypCMslPad7wDgNg6Rvd8jnvNhwDopotmfk5v4UesEpJlQFjoCMCya
    x4/NUOTbs2LzdcsammX0MMmio0nU+UVgrI/+8L6k7fvH60r8Br2kr87nKsrhr7QFm7rDvf
    V+q4TxvwEsD3czW36T4rPe8uJCS+2ueibNiuLZk+K8P578oSJGC8/sr9RSSMgX8uvfmh82
    Bz/aDzsPOQdnjfwYKzANuvdGIdX16DFtmH8qwzZWDa6eWnulSxcLHBiMWWyw
X-ME-Proxy: <xmx:MRowauLuRCVCDbGXAMRXlwPtAN4DKxoJ_DrlmT4EJ2VtIHgHCzkmZA>
    <xmx:MRowaouiBDSH7DsuvuLcPbndLS9b6BVdA-hdGKq6erElUF9xgvX8xw>
    <xmx:MRowaiXsQzl-_gvWqZR29vmvaGchl3a8_Hy1NW5EcOrY57jjV-nbLg>
    <xmx:MRowajh_vT31XOVSURWq8w6PFI3NVdGoOyUELR6ry8uIBTKn6UzO6g>
    <xmx:MRowaq_wsSVhWTDsk3HQ1Sq5K0rtsndNw-R2FembNkrfgMOGPjo3Tisq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 11457182007E; Mon, 15 Jun 2026 11:28:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AiNCL5RzVN0N
Date: Mon, 15 Jun 2026 17:28:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Armin Wolf" <W_Armin@gmx.de>
Cc: "Shuangpeng Bai" <shuangpeng.kernel@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <c42ebb27-18c4-4211-96d5-3bc5d3239cb7@app.fastmail.com>
In-Reply-To: <2026061525-dayroom-backspace-4273@gregkh>
References: <178144969601.60470.13396800403157907003@gmail.com>
 <543e7c0f-ae4b-49e4-8bdf-6bf7d0dc4775@gmx.de>
 <2026061525-dayroom-backspace-4273@gregkh>
Subject: Re: [BUG] KASAN: slab-use-after-free in _copy_to_user from
 platform/x86/dell-smbios-wmi
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jun 15, 2026, at 15:30, gregkh@linuxfoundation.org wrote:
> On Mon, Jun 15, 2026 at 02:19:16PM +0200, Armin Wolf wrote:
>> Am 14.06.26 um 21:15 schrieb Shuangpeng Bai:
>> 
>> > Hi Kernel Maintainers,
>> > 
>> > I hit the following report while testing current upstream kernel:
>> > 
>> > KASAN: slab-use-after-free in _copy_to_user from platform/x86/dell-smbios-wmi
>> > 
>> > on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)
>> > 
>> > The reproducer and .config files are here.
>> > https://gist.github.com/shuangpengbai/f5b15c099e80897486b4238ddb91df79
>> > 
>> > I'm happy to test debug patches or provide additional information.
>> 
>> It seems that unbinding the dell-smbios-wmi driver races with any outstanding
>> file operations on the misc device, causing them to access memory already freed
>> by the unbound driver.
>
> How can that happen if the module reference count is properly
> incremented when the file is open?  Perhaps the driver isn't doing that
> correctly?

It's not, and I think in addition, the probe function needs to
take a reference on the wmi_device do that does not go away while
the misc device exists.

      Arnd
