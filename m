From: Michal Hocko <mhocko@suse.cz>
Subject: Re: Possible broken MM code in dell-laptop.c?
Date: Tue, 16 Jun 2015 09:43:09 +0200
Message-ID: <20150616074308.GB24296@dhcp22.suse.cz>
References: <201506141105.07171@pali>
 <20150615211816.GC16138@dhcp22.suse.cz>
 <201506152327.59907@pali>
 <20150616063346.GA24296@dhcp22.suse.cz>
 <20150616071523.GB5863@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43683 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751989AbbFPHnS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 16 Jun 2015 03:43:18 -0400
Content-Disposition: inline
In-Reply-To: <20150616071523.GB5863@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Stuart Hayes <stuart_hayes@dell.com>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org

On Tue 16-06-15 09:15:23, Pali Roh=E1r wrote:
[...]
> Michal, thank you for explaining this situation!
>=20
> Darren, I will prepare patch which will fix code and use __free_page(=
).
>=20
> (Btw, execution on fail_rfkill label caused kernel panic)

I am sorry, I could have made it more clear in the very first email.
A panic is to be expected because free_page will translate the given
address to a struct page* but this is what the code gave it. So an
unrelated struct page would be freed (or maybe an invalid one).

--=20
Michal Hocko
SUSE Labs
