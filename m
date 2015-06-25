From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] dell-laptop: Fix allocating & freeing SMI buffer page
Date: Wed, 24 Jun 2015 20:23:41 -0700
Message-ID: <20150625032341.GA18285@vmdeb7>
References: <1434876063-13460-1-git-send-email-pali.rohar@gmail.com>
 <1435047079-949-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <1435047079-949-1-git-send-email-pali.rohar@gmail.com>
Sender: owner-linux-mm@kvack.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Michal Hocko <mhocko@suse.cz>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jun 23, 2015 at 10:11:19AM +0200, Pali Roh=E1r wrote:
> This commit fix kernel crash when probing for rfkill devices in dell-la=
ptop
> driver failed. Function free_page() was incorrectly used on struct page=
 *
> instead of virtual address of SMI buffer.
>=20
> This commit also simplify allocating page for SMI buffer by using
> __get_free_page() function instead of sequential call of functions
> alloc_page() and page_address().
>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> Acked-by: Michal Hocko <mhocko@suse.cz>
> Cc: stable@vger.kernel.org

Queued, thanks Pali.

--=20
Darren Hart
Intel Open Source Technology Center

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=3Dmailto:"dont@kvack.org"> email@kvack.org </a>
