From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH 11/15] samsung-laptop: add keyboard backlight support
Date: Tue, 22 Nov 2011 14:23:54 -0800
Message-ID: <20111122222354.GK24283@suse.de>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
 <1321999366-23784-12-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1321999366-23784-12-git-send-email-corentincj@iksaif.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 22, 2011 at 11:02:42PM +0100, Corentin Chary wrote:
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>

What happens on boxes that don't have this type of hardware?  Will the
LED device still show up, yet it will not work?

You should be able to trigger this off of the model type somehow, much
like the video backlight should work.

thanks,

greg k-h
