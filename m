From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH 14/15] samsung-laptop: dump model and version informations
Date: Tue, 22 Nov 2011 14:28:09 -0800
Message-ID: <20111122222809.GN24283@suse.de>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
 <1321999366-23784-15-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1321999366-23784-15-git-send-email-corentincj@iksaif.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 22, 2011 at 11:02:45PM +0100, Corentin Chary wrote:
> We still need to figure out exactly what each of different fields
> represent, but they contain at least model and version informatiosn.
> 
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>

For every time the driver loads?  That's not nice, how about putting
this into debugfs instead?

thanks,

greg k-h
