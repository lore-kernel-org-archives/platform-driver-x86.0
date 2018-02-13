From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: merge fill_request and
 send_request
Date: Tue, 13 Feb 2018 23:17:42 +0100
Message-ID: <20180213221742.q4m5tzsaxvouzw7l@pali>
References: <20180213211617.GA7117@laszlth>
 <20180213213214.GA7419@laszlth>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="kogj5ap2etinl5jc"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33714 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965900AbeBMWRp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Feb 2018 17:17:45 -0500
Received: by mail-wm0-f68.google.com with SMTP id x4so15101065wmc.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Feb 2018 14:17:45 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20180213213214.GA7419@laszlth>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Laszlo Toth <laszlth@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, platform-driver-x86@vger.kernel.org


--kogj5ap2etinl5jc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi! This would be ratter longer email, but I hope I write everything
needed.

On Tuesday 13 February 2018 22:32:14 Laszlo Toth wrote:
> Answer to Pali from the prev. thread (before splitting):
>=20
> "Hi!
> I agree, there are a lot of 0s just to overwrite a 0 with 0
> after memset.
> So filling the buffer args could be improved regardless of my patch,
> after that the merged function wouldn't have so many.
> But for now I just changed them to one call. This way it won't have
> to pass buffer ptr twice to 2 functions "chained" together and
> already full of params to send a request.

Main problem is that I still do not see a big benefit of it.

Or to say it in opposite way, why it is worse to have two functions and
need to pass buffer pointer to both functions (for obvious reason) as a
first parameter?

> There is one called and job done.

Apparently job is not done. There are also output parameters filled by
SMM (remote side) which caller wants to inspect. Job is: prepare,
fill, execute, fetch and process (check output/result).

> You're right in general, but this one is kinda special:
> it does what you want _and_ holds the values you need to do that, too.
> So this isn't a heavily used and modified function call I think, more
> like a define without an actual define.
>=20
> With these in mind I think it's better like this, you just check the
> last line and done. That's how I found the typo in the other commit
> as after &buffer it was invisible. I thought it might help."

If you are going to write a new call or modify existing (for any reason)
you need to look at every one argument in that function. And if you want
to understand what is that function doing (again for any reason,
including "verification that code is written correctly"), you need to map
each positional argument to its meaning.

And I think generally functions with lot of parameters are reading
harder then function with few (3-4 arguments).

We can also open another question, why your proposed function takes
buffer structure which has members for input arguments, but also takes
input arguments as function parameters? Seems a bit illogical and
probably can confuse some people.


Just another look at it:

Buffer consists of 3 parts:

1) input parameters
2) output parameters
3) type of the SMM call (selector/class or how it is called in Dell termino=
logy)

For sending current buffer to SMM there is a one function for it. And
part of it you specify also type of the SMM call.

Another (helper) function was created to fill input parameters into
buffer, so user would not need to manually clear buffer (via memset) and
then assign needed parameters.

And until now there was no need to create (helper) function to do
something with output parameters. If somebody needs them, just access
it.

I think this is just classic decomposition for solving some problem into
smaller pieces (fill input parameters, send request).

It can be compared to problem "write buffer to file". You have name of
file, access mode for file, permissions (in case to create new file),
buffer which you want to write and size of buffer. But you do not have
one function which do everything and takes lot of parameters. Rather you
have a function to create or open file and function to send data to
opened file. For each logic one function.



And another point of view:

Looking at code

  dell_send_request(&buffer, CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT);

I can deduce just from function names and parameters that it sends some
buffer to keyboard backlight service. Without reading implementation of
that function.

After your change there is a code

  dell_send_request(&buffer, CLASS_KBD_BACKLIGHT, SELECT_KBD_BACKLIGHT, 0, =
0, 0, 0);

I can just deduce it does something with buffer, probably send it into
keyboard backlight service, but I have absolutely no idea what are there
doing four zeros and why there are needed.

To make it more readable I need to do something like this:

  #define ARGUMENT_1_FOR_KBD_BACKLIGHT_GET_FEATURE_INFORMATION 0
  #define ARGUMENT_2_FOR_KBD_BACKLIGHT_GET_FEATURE_INFORMATION 0
  #define ARGUMENT_3_FOR_KBD_BACKLIGHT_GET_FEATURE_INFORMATION 0
  #define ARGUMENT_4_FOR_KBD_BACKLIGHT_GET_FEATURE_INFORMATION 0

  dell_send_request(
    &buffer,
    CLASS_KBD_BACKLIGHT,
    SELECT_KBD_BACKLIGHT,
    ARGUMENT_1_FOR_KBD_BACKLIGHT_GET_FEATURE_INFORMATION,
    ARGUMENT_2_FOR_KBD_BACKLIGHT_GET_FEATURE_INFORMATION,
    ARGUMENT_3_FOR_KBD_BACKLIGHT_GET_FEATURE_INFORMATION,
    ARGUMENT_4_FOR_KBD_BACKLIGHT_GET_FEATURE_INFORMATION
  );

Then I can deduce from code that it send request for asking feature
information about keyboard backlight. And also I know what are
arguments, what is definition of SMM request.

But it is too verbose, long and unusual.

If I want to prevent writing such verbose code, I can logically split
one function call into more. And one logic part of this are input
arguments.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--kogj5ap2etinl5jc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCWoNkBAAKCRCL8Mk9A+RD
Ul+MAKCLDhq1EpSuaTXfiKdew6eoc6Gp9wCcDv1/U8oVpqfwVbV8oxXCGAVlq3U=
=5AXL
-----END PGP SIGNATURE-----

--kogj5ap2etinl5jc--
