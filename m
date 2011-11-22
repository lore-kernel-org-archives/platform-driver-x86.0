From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH 05/15] samsung-laptop: ehance SABI support
Date: Tue, 22 Nov 2011 14:18:29 -0800
Message-ID: <20111122221829.GB24283@suse.de>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
 <1321999366-23784-6-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1321999366-23784-6-git-send-email-corentincj@iksaif.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 22, 2011 at 11:02:36PM +0100, Corentin Chary wrote:
> * SABI command are on 16 bits, not 8

Are you sure about that?  I guess this would work, and we rely on the
bits being in the right order so everything works properly?

> * SABI can read/write up to 11 byte of data

It can?

> * There is not real difference between "get" and "set"
>   commands, so refactorise the code of both functions

Ah, nice, I always wanted to do that.

> Signed-off-by: Corentin Chary <corentincj@iksaif.net>

Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
