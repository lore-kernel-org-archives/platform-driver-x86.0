From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Sun, 5 Jul 2015 06:51:16 +0200
Message-ID: <20150705045116.GA2401@eudyptula.hq.kempniu.pl>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <201507022258.32104@pali>
 <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
 <201507042324.57768@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:33299 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751712AbbGEIz2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Jul 2015 04:55:28 -0400
Received: by laar3 with SMTP id r3so124057950laa.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Jul 2015 01:55:26 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <201507042324.57768@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

> OK, and can you write what is needed to fill into buffer?

Here is the critical part of a working patch I prepared for
dell-laptop.c:

    get_buffer();
    buffer->input[0] =3D 0x10000;
    buffer->input[1] =3D 0x51534554;
    buffer->input[3] =3D 0x1;
    dell_send_request(buffer, 17, 3);
    ret =3D buffer->output[0];
    release_buffer();

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
