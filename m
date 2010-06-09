From: Dave Airlie <airlied@gmail.com>
Subject: Re: [GIT PULL] x86 platform driver updates for 2.6.35-rc3
Date: Wed, 9 Jun 2010 12:03:55 +1000
Message-ID: <AANLkTin45ibtZoThRwOG3eTjFmT0LJ4gKS-ExXqpKx2v@mail.gmail.com>
References: <20100608221901.GA25294@srcf.ucam.org>
	<alpine.LFD.2.00.1006081806040.4506@i5.linux-foundation.org>
	<20100608182456.3e681359@virtuousgeek.org>
	<alpine.LFD.2.00.1006081855170.4506@i5.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:38020 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751453Ab0FICD4 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Jun 2010 22:03:56 -0400
In-Reply-To: <alpine.LFD.2.00.1006081855170.4506@i5.linux-foundation.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, Matthew Garrett <mjg59@srcf.ucam.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Wed, Jun 9, 2010 at 11:57 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>
> On Tue, 8 Jun 2010, Jesse Barnes wrote:
>>
>> FWIW this is the "make ironlake go fast" driver. =A0It interacts wit=
h the
>> i915 driver to increase graphics performance significantly. =A0But y=
eah,
>> Matthew and I didn't get it integrated into his tree in time for the
>> merge window, so I understand if you don't want it right now.
>
> I'm not great at all the intel code-names. Is ironlake the expected-Q=
4
> on-die GPU or the current one?
>
> Not that I'd prefer to pull it even if it's the current one, but if i=
t's
> the next-gen one then we're in even less of a hurry, I think.
>

Its probably the one on your desk, its at least the one in the two
laptops on mine.

So definitely now-gen.

Dave.
--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
