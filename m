From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH 07/15] samsung-laptop: remove selftest
Date: Tue, 22 Nov 2011 14:21:03 -0800
Message-ID: <20111122222103.GG24283@suse.de>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
 <1321999366-23784-8-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1321999366-23784-8-git-send-email-corentincj@iksaif.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 22, 2011 at 11:02:38PM +0100, Corentin Chary wrote:
> We can now do the self test using debugfs, so remove the code
> and keep the debug flag to enable more traces.
> 
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>

Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
