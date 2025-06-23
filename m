Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CA1253953
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jun 2025 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686768; cv=none; b=GzYmYWjQKkJBl5CZr/bbsix0dZlxf2ppdOP6DLjbJEkpxwgWTwNq23QUQBzJm75R/wWrwMUTGJgMcKKclb0YlDSNxmVGh+2uJVHNXQFkty3uL6EmYOtC6qDbL6TbOXNsgZMU42pxFCvwhp6COwTg4P9jqoPqulhsTvdz8JobrXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686768; c=relaxed/simple;
	bh=ejhM5IvVt6CcNOF039XyDcqVYMFWoTJsz6sqXT+Kh8Q=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=nt/pn3Y0+M9bXwgMnh4BleoXcYM2oIdkZKB4oLffkTqbqr2oIy//QLGyAJFl6gCAF+00fQBuWVpYnWIpbAzn4uRxJ9uQ9bAIjNKgbUaPRuoGMhF6GgJy/i9P1aQ80Qy5j06cGPbBv6YjXK7t6tVeANO62geS5FVsDTHEpJ1RGnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benis.se; spf=pass smtp.mailfrom=benis.se; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=benis.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=benis.se
Date: Mon, 23 Jun 2025 13:52:34 +0000
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
From: =?utf-8?Q?Benjamin_Hasselgren-Hall=C3=A9n?= <benjamin@benis.se>
Subject: HP Omnibook Ultra Flip 14 - power profiles
Message-ID: <GXa7F-PA_8BE7nlK9r8dkdSv7c-DW52GvOUiyYHQ6RyoZDxIpNAocWDPYQDeS7WEZeUisqQH_bqmgSV-eaRmuw5r68MGKxyU9X_4Erd0RYQ=@benis.se>
Feedback-ID: 18592338:user:proton
X-Pm-Message-ID: b20ccbb30a7ae7be8eee9f039166f8109b5e6274
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi dear Linux friends,

This is very much a long shot and I understand if no one got any time or mo=
tivation for this.However, I am trying to understand how HP Omnibook Ultra =
Flip (a laptop with Lunar Lake platform) working with power profiles. The r=
eason is that it seems to be very limited while running Linux (to 30 watts =
to be exact, no matter the power profile, this is for the whole laptop, to =
compare with something the Omnibook Ultra 14 with AMD Strix draws up to ove=
r 70 watts, sure more power hungry platform but still). Also the gpu perfor=
mance is not as it should be.
So if anyone got the time or so - let me know where to start digging!


Best regards,
Benjamin Hasselgren-Hall=C3=A9n
