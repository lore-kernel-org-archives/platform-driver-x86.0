From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Thu, 21 Jan 2016 18:08:38 -0600
Message-ID: <56A17306.3010503@dell.com>
References: <cover.1447479930.git.luto@kernel.org>
 <db83b63cc163ecc640d5d1c5554f8aa87beaadfc.1447479930.git.luto@kernel.org>
 <20151121000636.GG7413@malice.jf.intel.com>
 <CALCETrVz+4CX=rjY5OZfCSGQDcgW1oQe6t8d9940ubQKDv-Eqg@mail.gmail.com>
 <20151122020414.GR16374@dell.com> <20151123145351.GG24147@pali>
 <20160121101711.GY7192@pali>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="6nx0WcXIvlIo0hBPJomnmjdge7iaWuIQv"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from AUSXIPPS310.us.dell.com ([143.166.148.211]:48736 "EHLO
	ausxipps310.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751470AbcAVAVu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Jan 2016 19:21:50 -0500
In-Reply-To: <20160121101711.GY7192@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, "Dominguez, Jared" <Jared_Dominguez@DELL.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Darren Hart <dvhart@infradead.org>, Andy Lutomirski <luto@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6nx0WcXIvlIo0hBPJomnmjdge7iaWuIQv
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 01/21/2016 04:17 AM, Pali Roh=C3=A1r wrote:
> On Monday 23 November 2015 15:53:51 Pali Roh=C3=A1r wrote:
>> On Saturday 21 November 2015 20:04:15 D. Jared Dominguez wrote:
>>> On Fri, Nov 20, 2015 at 06:12:58PM -0600, Andy Lutomirski wrote:
>>>> Jared, want to give us some guidance as to whether this code is
>>>> correct at all and, if so, whether we should actually send a
>>>> KEY_RFKILL event from dell-wmi when the key is pressed?
>>>>
>>>> IOW, should we allow dell-wmi to handle rfkill or should we wait for=

>>>> the other mechanism?
>>>>
>>>> --Andy
>>> I'm adding Mario since he's worked on our client systems much longer =
and
>>> knows more about the correct behavior for our hotkeys. I've not yet r=
ead
>>> through any of our documentation about our hotkey behavior so wouldn'=
t be as
>>> qualified to answer that. Note that both Mario and I are on vacation =
until
>>> the 30th, so he may not reply until then.
>>>
>>> --Jared
>>>
>> Jared, thanks for your input! When you or Mario are back from vacation=
,
>> can you look at it? Or if you do not have much time, can you provide
>> documentation (or some snippets), so somebody else can update driver t=
o
>> work correctly?
> Hi Jared & Mario, I believe you are back from vacation, can you look at=
 it?
>
Pali,

I understand that intel-hid will be making it in at this point.  If I'm
not mistaken, it should be handling this portion.

Andy,

Is that right now?  Or is this on a different topic?


--6nx0WcXIvlIo0hBPJomnmjdge7iaWuIQv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlahcwYACgkQ2CrZjkA73Yu8QQCeIwQhXnnSJKuzZMyuLk96t9L6
5aEAn31RhmgnSGNUIAAzHv+9UwaDcU9R
=C7M5
-----END PGP SIGNATURE-----

--6nx0WcXIvlIo0hBPJomnmjdge7iaWuIQv--
