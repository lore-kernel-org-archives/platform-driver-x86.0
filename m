From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: acer-wmi auto-loaded on a Lenovo Thinkpad X1 Carbon 4th gen
Date: Sun, 21 Aug 2016 13:58:49 +0200
Message-ID: <8737lyxrie.fsf@miraculix.mork.no>
References: <87vb07lx0s.fsf@miraculix.mork.no>
        <20160719045518.GA26365@linux-rxt1.site>
        <87k2fr7erw.fsf@miraculix.mork.no>
        <20160821011518.GA3740@linux-rxt1.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:47993 "EHLO canardo.mork.no"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751694AbcHUL7D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Aug 2016 07:59:03 -0400
In-Reply-To: <20160821011518.GA3740@linux-rxt1.site> (joeyli's message of
        "Sun, 21 Aug 2016 09:15:18 +0800")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: platform-driver-x86@vger.kernel.org

joeyli <jlee@suse.com> writes:

> Hi Bj=C3=B8rn,=20
>
> Sorry for my delay because I stuck on other issues.

No, problem. The problem is an old one, so there is no hurry :)

And it's always best to take the time necessary to work out a good long
term solution.

> I have a question about removed 67C3371D-95A3-4C37-BB61-DD47B491DAAB. It
> already in acer-wmi a long time since Carlos contributed this driver in
> 2008.=20
>
> Does it possible cause regression on some laptops if we removed this GUID
> support in acer-wmi?=20

Yes, I guess the risk of that is high.  It might be unacceptably high.
That's for you to decide...

I just wanted to point out that this WMI match seems to be based on
false assumptions initially, and that the current blacklisting strategy
is a game you *will* lose. Or have already lost... Only a small fraction
of the false positives will ever be reported.

The negative match on the "norfkill_ids" list of ACPI IDs from a number
of different vendors for example, will of course make the driver work
with any Acer IDs.  But why not list those instead, doing a positive
match on the systems you want to support? So much easier, and actually
possible to complete.  The problem, of course, is that you don't have a
record of the IDs you want to match...  But collecting those should be
possible if you start making the driver report them. It is most likely
just a single one?

IMHO, for a driver like this, "working" on the target system is not
enough.  You need to ensure that it doesn't negatively affect other
systems. That's impossible when you do negative matching. I don't think
ACPI or WMI drivers should ever have to run a probe on any system they
don't support. Either you have a matching ID, which can be coded into
the module alias table, or you don't.  Or am I missing something?

Anyway, fixing the acer_wmi_get_handle() matching logic in
acer_wmi_accel_setup() should not cause any regressions, since that one
seems to be based on positive matching of the "SENR" method of the
"BST0001" device".  There's just a minor flaw in the ACPI lookup logic.


Bj=C3=B8rn
